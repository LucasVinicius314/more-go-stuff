package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net"
	"sure/main/todo"
	"time"

	firebase "firebase.google.com/go"
	"github.com/jschoedt/go-firestorm"
	mapper "github.com/jschoedt/go-structmapper"
	"google.golang.org/api/option"
	"google.golang.org/grpc"
)

var (
	port = flag.Int("port", 50051, "The server port")
)

type Server struct {
	todo.UnimplementedTodoListServer
}

func (s *Server) AddTodo(ctx context.Context, in *todo.AddTodoRequest) (*todo.AddTodoReply, error) {
	log.Printf("Received: %v", in.GetName())

	return &todo.AddTodoReply{Message: "Hello " + in.GetName()}, nil
}

func main() {
	// firestore

	ctx := context.Background()

	sa := option.WithCredentialsFile("service-account.json")

	app, err := firebase.NewApp(ctx, nil, sa)

	if err != nil {
		log.Fatalln(err)
	}

	client, err := app.Firestore(ctx)

	if err != nil {
		log.Fatalln(err)
	}

	defer client.Close()

	// firestorm

	fsc := firestorm.New(client, "ID", "")

	fsc.MapFromDB.MapFunc =
		func(inKey string, inVal interface{}) (mt mapper.MappingType, outKey string, outVal interface{}) {
			return mapper.Default, inKey, outVal
		}

	fsc.MapToDB.MapFunc =
		func(inKey string, inVal interface{}) (mt mapper.MappingType, outKey string, outVal interface{}) {
			return mapper.Custom, inKey, outVal
		}

	now := time.Now()

	instance := &todo.Todo{
		Title:     "Test",
		Content:   "Maybe",
		CreatedAt: now,
		UpdatedAt: now,
	}

	fsc.NewRequest().CreateEntities(ctx, instance)()

	// grpc

	flag.Parse()

	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", *port))

	if err != nil {
		log.Fatalf("Failed when attempting to listen: %v", err)
	}

	s := grpc.NewServer()

	todo.RegisterTodoListServer(s, &Server{})

	log.Printf("Server listening at %v", lis.Addr())

	if err := s.Serve(lis); err != nil {
		log.Fatalf("Failed whe attempting to serve: %v", err)
	}
}
