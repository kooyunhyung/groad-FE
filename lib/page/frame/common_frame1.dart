import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:gload_app/page/Menu_screens/Login_Info/LoginPage.dart';
import 'package:gload_app/page/Menu_screens/inquiry/inquiry.dart';
import 'package:gload_app/page/Menu_screens/question/question.dart';
import 'package:gload_app/page/Menu_screens/setting/setting.dart';

import '../../constant/theme.dart';
import '../Main_screens/benefits.dart';
import '../Main_screens/feed.dart';
import '../Main_screens/floatingActionButton/expandable_fab.dart';
import '../Main_screens/mypage.dart';
import '../Main_screens/schedule.dart';
import '../Menu_screens/TravleInfo/TravelInfo.dart';
import '../Menu_screens/travelAssistant/termsOfUse.dart';
import 'common_frame2.dart';

class CommonFrame1 extends StatefulWidget {
  const CommonFrame1({Key key, this.title, this.clas}) : super(key: key);

  final Object clas;
  final String title;

  @override
  _CommonFrame1State createState() => _CommonFrame1State();
}

class _CommonFrame1State extends State<CommonFrame1> {
  String _output = 'Empty Scan Code';

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 2;
    var pages = [
      Schedule(), //하단 0번 인덱스
      Benefits(), //하단 1번 인덱스
      widget.clas, //하단 2번 인덱스(default)
      Feed(), //하단 3번 인덱스
      MyPage(), //하단 4번 인덱스
    ];

    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              DrawerHeader(
                child: Row(
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
                              MaterialPageRoute(
                                  builder: (context) => CommonFrame2(
                                        title: '로그인',
                                        clas: LoginPage(),
                                      )),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            CommonFrame2(title: '여행 정보', clas: TravelInfo())),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '여행 도우미',
                  style: textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                              title: '여행 도우미',
                              clas: TermsOfUse(),
                            )),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '자주 묻는 질문',
                  style: textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                              title: '자주 묻는 질문',
                              clas: Question(),
                            )),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '이벤트',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '문의하기',
                  style: textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                              title: '문의하기',
                              clas: Inquiry(),
                            )),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '도움말',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '이용 약관',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '설정',
                  style: textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                              title: '설정',
                              clas: Setting(),
                            )),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '로그아웃',
                  style: textTheme().headline1,
                ),
                onTap: () {},
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
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
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(ThemeColors.deepNavy)),
          ),
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          //   IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          // ],
        ),
      ),
      //앱 바
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex, //선택된 인덱스
        onTap: (index) {
          setState(() {
            print(index);
            selectedIndex = index;
          });
        },
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
            onPressed: () => _scan(),
            tooltip: 'scan',
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


  Future _scan() async{
    String barcode = await scanner.scan();
    setState(() {
      _output = barcode;
      print('qrcode: $_output');
    });
  }
}

