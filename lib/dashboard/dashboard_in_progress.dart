import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/colors.dart';
import 'package:flutter_todo_app/dashboard/dashboard_daterow.dart';

class InProgressComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [InProgressTitle(), InProgressTasks()],
    );
  }
}

class InProgressTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 10.0),
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: "In ",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            )),
        TextSpan(
            text: "Progress",
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 24.0, color: Colors.black)),
      ])),
    );
  }
}

class InProgressTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Text("Create new card",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0)),
                  DateRow()
                ],
              )),
            ],
          ),
        ));
  }
}
