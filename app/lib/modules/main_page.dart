import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:more_go_stuff/generated/todo/todo.pbgrpc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const route = 'main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('もっとGOのもの')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size.fromWidth(768)),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'こんにちは',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  child: const Text(
                    'Request',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    final channel = ClientChannel(
                      'localhost',
                      port: 50051,
                      options: const ChannelOptions(
                          credentials: ChannelCredentials.insecure()),
                    );

                    final stub = TodoListClient(channel);

                    try {
                      var response = await stub.addTodo(
                        AddTodoRequest()
                          ..title = 'Does it work'
                          ..content = 'Who knows',
                      );

                      if (kDebugMode) {
                        print('Greeter client received: ${response.message}');
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        rethrow;
                      }
                    }

                    await channel.shutdown();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
