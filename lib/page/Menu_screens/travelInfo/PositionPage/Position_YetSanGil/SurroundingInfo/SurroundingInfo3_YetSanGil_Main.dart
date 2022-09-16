import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/benefits.dart';
import 'package:gload_app/page/Main_screens/feed.dart';
import 'package:gload_app/page/Main_screens/floatingActionButton/expandable_fab.dart';
import 'package:gload_app/page/Main_screens/mypage.dart';
import 'package:gload_app/page/Main_screens/schedule.dart';
import 'package:gload_app/page/Main_screens/theme.dart';
import 'package:gload_app/page/Menu_screens/Login_Info/LoginPage_Main.dart';
import 'package:gload_app/page/Menu_screens/travelAssistant/travelAssistant.dart';

import '../../../TravelInfo_Main.dart';
import 'SurroundingInfo3_YetSanGil.dart';

class SurroundingInfo3_YetSanGil_Main extends StatefulWidget {
  const SurroundingInfo3_YetSanGil_Main({Key? key}) : super(key: key);

  @override
  _SurroundingInfo3_YetSanGil_MainState createState() => _SurroundingInfo3_YetSanGil_MainState();
}

class _SurroundingInfo3_YetSanGil_MainState extends State<SurroundingInfo3_YetSanGil_Main> {
  var _selectedIndex = 2; //페이지 인덱스 0,1
  var _pages = [
    Schedule(), //하단 0번 인덱스
    Benefits(), //하단 1번 인덱스
    SurroundingInfo3_YetSanGil(), //하단 2번 인덱스(default)
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
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '로그인 해주세요',
                          style: textTheme().headline2,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage_Main()),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                '로그인',
                                style: textTheme().subtitle1,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.black,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.account_circle_sharp,
                      color: Colors.grey,
                      size: 90.0,
                    ),
                  ],
                ),
              ), //로그인 정보
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
        ),
      ),
      //앱 바
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex, //선택된 인덱스
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '일정',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: '혜택',
            icon: Icon(Icons.card_giftcard_rounded),
          ),
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '피드',
            icon: Icon(Icons.list_alt),
          ),
          BottomNavigationBarItem(
            label: '마이페이지',
            icon: Icon(Icons.account_circle_sharp),
          ),
        ],
      ),
      //하단 아이콘
      floatingActionButton: ExpandableFab(
        distance: 150,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(
              Icons.qr_code,
              color: Colors.grey,
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(
              Icons.directions_walk,
              color: Colors.grey,
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(
              Icons.info,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      //플로팅 액션 버튼
    );
  }
}
