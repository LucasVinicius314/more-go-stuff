import 'package:flutter/material.dart';
import 'package:more_go_stuff/models/todo.dart';
import 'package:more_go_stuff/proto/todo/todo.pb.dart';
import 'package:more_go_stuff/widgets/create_todo_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const route = 'main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<GetTodosReply>? _todosReplyFuture;

  void _refetch() {
    setState(() {
      _todosReplyFuture = TodoCollection.getTodos();
    });
  }

  @override
  void initState() {
    super.initState();

    _refetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More go stuff')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size.fromWidth(768)),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CreateTodoWidget(refetch: _refetch),
                    FutureBuilder<GetTodosReply>(
                      future: _todosReplyFuture,
                      builder: (context, snapshot) {
                        final enabled =
                            snapshot.connectionState == ConnectionState.done;

                        final length = (snapshot.data?.todos ?? []).length;

                        return ListTile(
                          title: RichText(
                            text: TextSpan(
                              text: 'Todo list ',
                              style: Theme.of(context).textTheme.headline6,
                              children: [
                                if (enabled)
                                  TextSpan(
                                    text: '$length items',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: enabled ? _refetch : null,
                          ),
                        );
                      },
                    ),
                    FutureBuilder<GetTodosReply>(
                      future: _todosReplyFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          final todos = snapshot.data?.todos ?? [];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: todos.map((e) {
                              return ListTile(
                                title: Text(e.title),
                                subtitle: Text(e.content),
                              );
                            }).toList(),
                          );
                        }

                        return const Padding(
                          padding: EdgeInsets.all(32),
                          child: Center(
                            child: SizedBox.square(
                              dimension: 32,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
