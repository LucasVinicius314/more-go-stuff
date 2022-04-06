import 'package:flutter/material.dart';
import 'package:more_go_stuff/models/todo.dart';
import 'package:more_go_stuff/proto/todo/todo.pb.dart';

class CreateTodoWidget extends StatefulWidget {
  const CreateTodoWidget({Key? key}) : super(key: key);

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
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

      final response = await TodoCollection.addTodo(
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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
    );
  }
}
