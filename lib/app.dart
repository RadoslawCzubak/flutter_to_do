import 'package:flutter/material.dart';
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
      home: const DashboardPage(title: 'Dashboard Page'),
    );
  }
}
