import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/colors.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 24.0),
                    children: [
                  TextSpan(
                      text: 'Add ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'task')
                ])),
            TextField(decoration: InputDecoration(hintText: "Title")),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Description'),
            ),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Save"))
          ],
        ),
      ),
    ));
  }
}
