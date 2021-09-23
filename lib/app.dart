import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/add_task/add_task_page.dart';
import 'screens/dashboard/dashboard_page.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddTaskPage(),
    );
  }
}
