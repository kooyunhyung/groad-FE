import 'package:flutter/material.dart';
import 'package:gload_app/Menu_screens/Login_Info/LoginPage_Main.dart';
import 'package:gload_app/Menu_screens/travelInfo/TravelInfo_Main.dart';
import 'shortDistanceCourse.dart';
import 'package:gload_app/Main_screens/floatingActionButton/expandable_fab.dart';
import 'package:gload_app/Menu_screens/travelAssistant/travelAssistant.dart';
import 'package:gload_app/Main_screens/benefits.dart';
import 'package:gload_app/Main_screens/feed.dart';
import 'package:gload_app/Main_screens/mypage.dart';
import 'package:gload_app/Main_screens/schedule.dart';
import 'package:gload_app/Main_screens/theme.dart';
import 'localCourse.dart';
import 'longDistanceCourse.dart';
import 'mainCourse.dart';

class TourCourse extends StatefulWidget {
  const TourCourse({Key? key}) : super(key: key);

  @override
  _TourCourseState createState() => _TourCourseState();
}

class _TourCourseState extends State<TourCourse> {
  var _selectedIndex = 2;
  var _pages = [
    Schedule(), //하단 0번 인덱스
    Benefits(), //하단 1번 인덱스
    Tour(), //하단 2번 인덱스(default)
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

class Tour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> categories = ["메인 추천 코스", "장거리 코스", "단거리 코스", "지역별 코스"];
    return DefaultTabController(
      initialIndex: 0,
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.3, color: Colors.grey)),
                  color: Colors.white),
              child: TabBar(
                tabs: List.generate(
                  categories.length,
                  (index) => Tab(
                    text: categories[index],
                  ),
                ),
                isScrollable: true,
                labelColor: Color(deepNavy),
                unselectedLabelColor: Colors.grey,
                labelStyle: TextTheme().headline2?.copyWith(
                    color: Color(deepNavy), fontWeight: FontWeight.bold),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2, color: Color(deepNavy))),
              ),
            ),
            preferredSize: Size.fromHeight(0.0),
          ),
        ),
        body: TabBarView(
            children: [
              MainCourse(),
              LongDistanceCourse(),
              ShortDistanceCourse(),
              LocalCourse(),
            ]
        ),
      ),
    );
  }
}
