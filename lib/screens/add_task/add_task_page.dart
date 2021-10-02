import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/screens/add_task/cubit/add_task_cubit.dart';
import 'package:flutter_todo_app/styles/colors.dart';

class AddTaskPage extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTaskCubit>(
        create: (context) => AddTaskCubit(),
        child: Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: BlocConsumer<AddTaskCubit, AddTaskState>(
                    listener: (context, state) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Text added.")));
            }, builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                        text: TextSpan(
                            style:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                            children: [
                          TextSpan(
                              text: 'Add ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'task')
                        ])),
                    TextField(
                      decoration: InputDecoration(hintText: "Title"),
                      controller: titleController,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Description'),
                      controller: descriptionController,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AddTaskCubit>(context).addTask(
                              titleController.text, descriptionController.text);
                        },
                        child: Text("Save"))
                  ],
                ),
              );
            }))));
  }
}
