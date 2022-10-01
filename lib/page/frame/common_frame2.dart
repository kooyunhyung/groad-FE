import 'package:flutter/material.dart';

import '../../constant/theme.dart';
import '../Main_screens/benefits.dart';
import '../Main_screens/feed.dart';
import '../Main_screens/floatingActionButton/expandable_fab.dart';
import '../Main_screens/mypage.dart';
import '../Main_screens/schedule.dart';

class CommonFrame2 extends StatefulWidget {
  const CommonFrame2({Key key, this.title, this.clas}) : super(key: key);

  final Object clas;
  final String title;

  @override
  _CommonFrame2State createState() => _CommonFrame2State();
}

class _CommonFrame2State extends State<CommonFrame2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          title: Text(
            widget.title,
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Color(ThemeColors.deepNavy)),
          ),
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          //   IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          // ],
        ),
      ),
      //앱 바
      body: widget.clas,
    );
  }
}