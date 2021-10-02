import 'package:flutter/material.dart';
import 'add_task/add_task_page.dart';
import 'dashboard/dashboard_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => DashboardPage(title: 'To Do App'));
      case '/addtask':
        return MaterialPageRoute(builder: (_) => AddTaskPage());
      default:
        return MaterialPageRoute(
            builder: (_) => DashboardPage(title: 'To Do App'));
    }
  }
}
