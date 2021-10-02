import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/models/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskState());
  Repository repo = Repository.instance;

  void addTask(String title, String description) {
    repo.addProject(title, description);
    emit(AddTaskState(wasAdded: true));
  }
}
