import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/models/user.dart';

class Project {
  final String title;
  final String description;
  final List<String> labels;
  final List<Task> tasks;
  final List<User> users;
  final String startDate;
  final String endDate;

  const Project(this.title, this.description, this.labels, this.tasks,
      this.users, this.startDate, this.endDate);
}
