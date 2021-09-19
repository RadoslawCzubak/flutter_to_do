import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            DashboardUserProfile(),
            MainTitle(),
            MainTasksList(),
            Container(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, bottom: 10.0),
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "To ",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "Do",
                    style: TextStyle(fontSize: 24.0, color: Colors.black)),
              ])),
            ),
            ToDoList()
          ])),
    );
  }
}

class DashboardUserProfile extends StatelessWidget {
  const DashboardUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/Profile_avatar_placeholder_large.png',
              height: 50.0,
              width: 50.0,
            ),
          ),
          const SizedBox(
            width: 6.0,
          ),
          const Text(
            'Hello, ',
            style: TextStyle(fontSize: 20.0),
          ),
          const Text(
            'Amanda',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
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
                color: Colors.black)),
        TextSpan(
            text: "tasks today",
            style: TextStyle(fontSize: 24.0, color: Colors.black)),
      ])),
    );
  }
}

class MainTasksList extends StatelessWidget {
  const MainTasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView(
        itemExtent: 300.0,
        scrollDirection: Axis.horizontal,
        children: [
          MainItem(color: lightOrange),
          MainItem(color: lightBlue),
          MainItem(color: lightGreen),
          MainItem(color: lightRed)
        ],
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  Color color;

  MainItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Text(
              'Lorem ipsum dolor sit amet',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            )),
            DateRow(),
            TaskDescription(),
            LabelsRow(),
            PeoplesRow()
          ],
        ),
      ),
    );
  }
}

class TaskDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'Phasellus consectetur fringilla dolor nec viverra. Mauris viverra urna eu libero tempus rhoncus.',
    ));
  }
}

class LabelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(4.0),
        children: [
          Label(),
          Label(),
        ],
      ),
    );
  }
}

class PeoplesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                child: ClipOval(child: imagePlaceholder()),
              ),
              Positioned(child: ClipOval(child: imagePlaceholder()), left: 20),
              Positioned(child: ClipOval(child: imagePlaceholder()), left: 40),
              Positioned(child: ClipOval(child: imagePlaceholder()), left: 60),
            ],
          ),
        ),
        Expanded(child: Text('+ 4'))
      ],
    );
  }
}

Widget imagePlaceholder() {
  return Image.asset(
    'assets/images/Profile_avatar_placeholder_large.png',
    height: 50.0,
    width: 50.0,
  );
}

class Label extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Container(
        alignment: Alignment.center,
        height: 30.0,
        width: 70.0,
        child: Text(
          'High',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}

class DateRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text('Oct 25, 2021')],
    );
  }
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [lightRed, lightGreen, lightOrange, lightBlue];

    return Container(
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(16.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index % 2 == 1)
            return SizedBox(
              width: 10.0,
            );
          return ToDoItem(colorList[(index / 2 % 4).toInt()]);
        },
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  Color color;
  ToDoItem(this.color, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}
