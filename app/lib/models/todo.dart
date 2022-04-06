import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:more_go_stuff/generated/todo/todo.pbgrpc.dart';
import 'package:tuple/tuple.dart';

ClientChannel _getChannel() {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  return channel;
}

Tuple2<TodoListClient, Future<void> Function()> _getChannelStub() {
  final channel = _getChannel();

  final stub = TodoListClient(channel);

  Future<void> closeChannel() async {
    await channel.shutdown();
  }

  final out = Tuple2(stub, closeChannel);

  return out;
}

class Todo {
  static Future<AddTodoReply> addTodo(AddTodoRequest addTodoRequest) async {
    final channelStub = _getChannelStub();

    final stub = channelStub.item1;

    final response = await stub.addTodo(addTodoRequest);

    await channelStub.item2();

    if (kDebugMode) {
      print(DateTime.now());
      print(stub.runtimeType);
      print(response);
    }

    return response;
  }
}
