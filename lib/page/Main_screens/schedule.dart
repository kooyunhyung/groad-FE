import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Center(
        child: Text(
          'SchedulePage',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
