import 'package:flutter/material.dart';
import 'package:more_go_stuff/widgets/create_todo_widget.dart';

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
      appBar: AppBar(title: const Text('More go stuff')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size.fromWidth(768)),
          child: const CreateTodoWidget(),
        ),
      ),
    );
  }
}
