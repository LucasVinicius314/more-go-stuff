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
	"google.golang.org/api/option"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/timestamppb"
)

var (
	port = flag.Int("port", 50051, "The server port")
)

type Server struct {
	todo.UnimplementedTodoListServer
}

func (s *Server) AddTodo(ctx context.Context, in *todo.AddTodoRequest) (*todo.AddTodoReply, error) {
	title := in.GetTitle()
	content := in.GetContent()

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

	fsc := firestorm.New(client, "ID", "")

	now := time.Now()

	instance := &todo.Todos{
		Title:     title,
		Content:   content,
		CreatedAt: now,
		UpdatedAt: now,
	}

	fsc.NewRequest().CreateEntities(ctx, instance)()

	return &todo.AddTodoReply{Message: "Todo created."}, nil
}

func (s *Server) GetTodo(ctx context.Context, in *todo.GetTodoRequest) (*todo.GetTodoReply, error) {
	id := in.GetId()

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

	fsc := firestorm.New(client, "ID", "")

	instance := &todo.Todos{ID: id}

	fsc.NewRequest().GetEntities(ctx, instance)()

	return &todo.GetTodoReply{Todo: &todo.Todo{Id: instance.ID, Title: instance.Title, Content: instance.Content, CreatedAt: timestamppb.New(instance.CreatedAt), UpdatedAt: timestamppb.New(instance.UpdatedAt)}}, nil
}

func (s *Server) GetTodos(ctx context.Context, in *todo.GetTodosRequest) (*todo.GetTodosReply, error) {
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

	fsc := firestorm.New(client, "ID", "")

	instances := []todo.Todos{}

	fsc.NewRequest().GetEntities(ctx, instances)()

	newInstances := make([]*todo.Todo, len(instances))

	for i, v := range instances {
		newInstances[i] = &todo.Todo{Id: v.ID, Title: v.Title, Content: v.Content, CreatedAt: timestamppb.New(v.CreatedAt), UpdatedAt: timestamppb.New(v.UpdatedAt)}
	}

	return &todo.GetTodosReply{Todos: newInstances}, nil
}

func (s *Server) EditTodo(ctx context.Context, in *todo.EditTodoRequest) (*todo.EditTodoReply, error) {
	id := in.GetId()
	title := in.GetTitle()
	content := in.GetContent()

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

	fsc := firestorm.New(client, "ID", "")

	now := time.Now()

	instance := &todo.Todos{ID: id}

	fsc.NewRequest().GetEntities(ctx, instance)()

	instance.Title = title
	instance.Content = content
	instance.UpdatedAt = now

	fsc.NewRequest().UpdateEntities(ctx, instance)()

	return &todo.EditTodoReply{Message: "Todo edited."}, nil
}

func (s *Server) RemoveTodo(ctx context.Context, in *todo.RemoveTodoRequest) (*todo.RemoveTodoReply, error) {
	id := in.GetId()

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

	fsc := firestorm.New(client, "ID", "")

	instance := &todo.Todos{ID: id}

	fsc.NewRequest().DeleteEntities(ctx, instance)()

	return &todo.RemoveTodoReply{Message: "Todo removed."}, nil
}

func main() {
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
