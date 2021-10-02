import 'package:flutter_todo_app/models/project.dart';

class Repository {
  Repository._privateConstructor();
  static final Repository instance = Repository._privateConstructor();
  List<Project> projects = [];

  void addProject(String title, String description) {
    projects.add(Project(title, description, [], [], [], "", ""));
  }

  List<Project> getProjects() {
    return projects;
  }
}
