import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/benefits.dart';
import 'package:gload_app/page/Main_screens/feed.dart';
//import 'package:gload_app/Main_screens/floatingActionButton/expandable_fab.dart';
import 'package:gload_app/page/Main_screens/mypage.dart';
import 'package:gload_app/page/Main_screens/schedule.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Menu_screens/travelAssistant/travelAssistant.dart';
import 'package:gload_app/page/Menu_screens/travelInfo/TravelInfo_Main.dart';

import 'LoginPage.dart';

class LoginPage_Main extends StatefulWidget {
  const LoginPage_Main({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage_Main> {
  var _selectedIndex = 2;
  var _pages = [
    Schedule(), //하단 0번 인덱스
    Benefits(), //하단 1번 인덱스
    LoginPage(), //하단 2번 인덱스(default)
    Feed(), //하단 3번 인덱스
    MyPage(), //하단 4번 인덱스
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              ListTile(
                title: Text(
                  '여행 정보',
                  style: textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelInfo_Main()),
                  );
                },
              ), //여행 정보
              ListTile(
                leading: Text(
                  '여행 도우미',
                  style: textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelAssistant()),
                  );
                },
              ),
              ListTile(
                leading: Text(
                  '자주 묻는 질문',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '이벤트',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '문의',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '도움말',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '이용 약관',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '알림',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '로그아웃',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      //측면 메류 서랍
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          title: Text(
            'GROAD',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Color(deepNavy)),
          ),
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          //   IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          // ],
        ),
      ),
      //앱 바
      body: _pages[_selectedIndex],
      //하단 아이콘
    );
  }
}
