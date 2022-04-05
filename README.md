# more-go-stuff

An example todo list back end project that uses [gRPC](https://grpc.io/) for client-server communication and [Firestore](https://firebase.google.com/products/firestore) for data storage.

### Build & run

The project's launch configuration file resides at `.vscode/launch.json` .

### Compile protocol buffers

In order to compile protocol buffers, install [protoc](https://grpc.io/docs/protoc-installation/).

```bash
protoc --go_out=todo --go_opt=paths=source_relative --go-grpc_out=todo --go-grpc_opt=paths=source_relative    todo/todo.proto
```

### Links

* [Firestore](https://firebase.google.com/products/firestore)
* [Go](https://go.dev/)
* [go-firestorm](https://github.com/jschoedt/go-firestorm)
* [gRPC](https://grpc.io/)
* [grpc-go](https://github.com/grpc/grpc-go)
