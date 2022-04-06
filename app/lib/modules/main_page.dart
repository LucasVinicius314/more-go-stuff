import 'package:flutter/material.dart';
import 'package:more_go_stuff/generated/todo/todo.pbgrpc.dart';
import 'package:more_go_stuff/models/todo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const route = 'main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _titleFocusNode = FocusNode();
  final _contentFocusNode = FocusNode();

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _waiting = false;

  Future<void> _createTodo() async {
    if (_formKey.currentState?.validate() != true) return;

    try {
      setState(() {
        _waiting = true;
      });

      final title = _titleController.text;
      final content = _contentController.text;

      final response = await Todo.addTodo(
        AddTodoRequest()
          ..title = title
          ..content = content,
      );

      _titleController.clear();
      _contentController.clear();

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: Text(response.message),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  await Navigator.of(context).maybePop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('Something went wrong.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  await Navigator.of(context).maybePop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _waiting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More go stuff')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size.fromWidth(768)),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    'Create todo',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    enabled: !_waiting,
                    focusNode: _titleFocusNode,
                    controller: _titleController,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                      alignLabelWithHint: true,
                    ),
                    validator: (value) {
                      value ??= '';

                      if (value.length <= 4) return 'Title too short.';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    enabled: !_waiting,
                    focusNode: _contentFocusNode,
                    controller: _contentController,
                    decoration: const InputDecoration(
                      label: Text('Content'),
                      alignLabelWithHint: true,
                    ),
                    validator: (value) {
                      value ??= '';

                      if (value.length <= 4) return 'Content too short.';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: _waiting ? null : _createTodo,
                    child: const Text(
                      'CREATE TODO',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
