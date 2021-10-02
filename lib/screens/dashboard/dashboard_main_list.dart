import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/models/project.dart';
import 'package:flutter_todo_app/screens/dashboard/cubit/dashboard_cubit.dart';

import 'package:flutter_todo_app/screens/dashboard/dashboard_daterow.dart';
import 'package:flutter_todo_app/styles/colors.dart';

class MainComponent extends StatelessWidget {
  List<Project> projects = [];

  MainComponent({
    Key? key,
    required this.projects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [MainTitle(), MainTasksList(projects: projects)],
    );
  }
}

class MainTitle extends StatelessWidget {
  const MainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: "4 new ",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black)),
        TextSpan(
            text: "tasks today",
            style: TextStyle(
                fontSize: 24.0, color: Colors.black, fontFamily: 'Poppins')),
      ])),
    );
  }
}

class MainTasksList extends StatelessWidget {
  List<Project> projects = [];

  MainTasksList({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: ListView(
        itemExtent: 300.0,
        scrollDirection: Axis.horizontal,
        children: projects.map((e) {
          return MainItem(
            title: e.title,
            description: e.description,
            color: lightBlue,
          );
        }).toList(),
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  Color color;
  String title;
  String description;

  MainItem({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            )),
            DateRow(),
            Expanded(child: TaskDescription(text: description)),
            LabelsRow(),
            PeoplesRow()
          ],
        ),
      ),
    );
  }
}

class TaskDescription extends StatelessWidget {
  String text;

  TaskDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      text,
    ));
  }
}

class LabelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 4.0, right: 4.0, bottom: 4.0),
        children: const [
          Label(),
          Label(),
        ],
      ),
    );
  }
}

class PeoplesRow extends StatelessWidget {
  const PeoplesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Stack(
            children: [
              Positioned(
                child: ClipOval(child: imagePlaceholder()),
              ),
              Padding(
                  child: ClipOval(child: imagePlaceholder()),
                  padding: const EdgeInsets.only(left: 20)),
              Padding(
                  child: ClipOval(child: imagePlaceholder()),
                  padding: const EdgeInsets.only(left: 40)),
              Padding(
                  child: ClipOval(child: imagePlaceholder()),
                  padding: const EdgeInsets.only(left: 60)),
            ],
          ),
          const Padding(
            child: Text('+ 4'),
            padding: EdgeInsets.only(left: 20),
          )
        ],
      ),
    );
  }
}

Widget imagePlaceholder() {
  return Image.asset(
    'assets/images/Profile_avatar_placeholder_large.png',
    height: 35.0,
    width: 35.0,
  );
}

class Label extends StatelessWidget {
  const Label({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        alignment: Alignment.center,
        height: 30.0,
        width: 70.0,
        child: const Text(
          'High',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}
