import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateRow extends StatelessWidget {
  const DateRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/flag.svg',
            width: 20.0,
          ),
          const SizedBox(
            width: 5.0,
          ),
          const Text('Oct 25, 2021')
        ],
      ),
    );
  }
}
