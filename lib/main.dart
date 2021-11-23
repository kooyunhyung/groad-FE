import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Main_screens/main_screens.dart';
import 'Main_screens/theme.dart';

void main() => runApp(LoginDemo());

class LoginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _title,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainScreens(),
    );
  }
}





