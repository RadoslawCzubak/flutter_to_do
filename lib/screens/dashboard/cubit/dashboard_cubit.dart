import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/models/project.dart';
import 'package:flutter_todo_app/models/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  Repository repo = Repository.instance;

  DashboardCubit() : super(DashboardState([]));

  void getProjects() {
    List<Project> projects = repo.getProjects();
    emit(DashboardState(projects));
  }
}
