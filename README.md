# more-go-stuff

An example todo list back end project that uses [gRPC](https://grpc.io/) for client-server communication and [Firestore](https://firebase.google.com/products/firestore) for data storage.

### Build & run

The project's launch configuration file resides at `.vscode/launch.json` .

### Compile protocol buffers

In order to compile protocol buffers, install [protoc](https://grpc.io/docs/protoc-installation/).

#### Go

```bash
protoc --go_out=. --go_opt=paths=import --go-grpc_out=. --go-grpc_opt=paths=import proto/todo/todo.proto
```

#### Dart

```bash
protoc --dart_out=grpc:app/lib proto/todo/todo.proto

protoc --dart_out=grpc:app/lib proto/google/protobuf/timestamp.proto
```

### Todo

* App l10n

### Links

* [Firestore](https://firebase.google.com/products/firestore)
* [Go](https://go.dev/)
* [go-firestorm](https://github.com/jschoedt/go-firestorm)
* [gRPC](https://grpc.io/)
* [grpc-go](https://github.com/grpc/grpc-go)
