import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/colors.dart';
import 'package:flutter_todo_app/screens/dashboard/dashboard_daterow.dart';

class ToDoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ToDoTitle(), ToDoList()],
    );
  }
}

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [lightRed, lightGreen, lightOrange, lightBlue];

    return Container(
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
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

class ToDoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 10.0),
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: "To ",
            style: TextStyle(
                fontSize: 24.0, color: Colors.black, fontFamily: 'Poppins')),
        TextSpan(
            text: "Do",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ])),
    );
  }
}

class ToDoItem extends StatelessWidget {
  Color color;

  Map<Color, Color> colorToTextColorMap = {
    lightOrange: Colors.orange,
    lightGreen: Colors.green,
    lightRed: Colors.red,
    lightBlue: Colors.blue
  };

  ToDoItem(this.color, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Important',
                style: TextStyle(color: colorToTextColorMap[color]),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                'New Icon Version',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: DateRow(),
              padding: EdgeInsets.symmetric(vertical: 8.0),
            )
          ],
        ),
      ),
    );
  }
}
