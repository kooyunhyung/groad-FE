import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/TravelCourse/TravelCourse.dart';
import 'package:gload_app/page/Main_screens/components/food_store_item.dart';
import 'package:gload_app/models/popular_food_store.dart';
import 'package:gload_app/models/popular_room.dart';
import 'package:gload_app/page/frame/common_frame1.dart';
import 'components/room_item.dart';
import '../../constant/theme.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage;

  @override
  void initState() {
    currentPage=1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.3834,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (value) {
                    setState(() {
                      if(value == 1){
                        currentPage+=1;
                      }else{
                        currentPage-=1;
                      }
                    });
                  },
                  children: [
                    Stack(children: [
                      Container(
                        color: Colors.lightBlue[50],
                        width: width,
                        height: height * 0.3834,
                        child: Container(
                          padding: EdgeInsets.only(top: height * 0.1817, left: width * 0.0486),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '나를 찾기 위해 걷는',
                                style: TextStyle(
                                  fontSize: 6987 / width,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '마음의 길',
                                style: TextStyle(
                                    fontSize: 14385 / width,
                                    color: Color(ThemeColors.deepNavy),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ), //'나를 찾기 위해 걷는 마음의 길'
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.399, top: height*0.09398),
                        child: Image.asset(
                          'assets/character.png',
                        ),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: width*0.71411, top: height*0.00538),
                        child: Image.asset('assets/1.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: width*0.0788, top: height*0.02581),
                        child: Image.asset('assets/2.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: width*0.2357, top: height*0.085839),
                        child: Image.asset('assets/3.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: width*0.02506, top: height*0.1436),
                        child: Image.asset('assets/4.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: width*0.005839, top: height*0.277318),
                        child: Image.asset('assets/5.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: width*0.244768, top: height*0.300751),
                        child: Image.asset('assets/6.png'),
                      ), //데코레이션
                    ]),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width*0.04866),
                      width: width,
                      height: height*0.38345,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '2021년 9월 1일',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '강원도 춘천시',
                                style: TextStyle(
                                  color: Color(ThemeColors.deepNavy),
                                  fontSize: 12330 / width,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: width*0.2433,),
                              Text(
                                '26 ℃',
                                style: TextStyle(
                                  color: Color(ThemeColors.deepNavy),
                                  fontSize: 12330 / width,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height*0.02506,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '뜨거운 태양이 내리쬐는 오늘',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    '햇살을 만끽하며 걸어볼까요?',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: width*0.12165,),
                              Container(
                                width: width*0.3017,
                                height: width*0.3017,
                                color: Colors.grey[400],
                                child: Center(
                                    child: Text(
                                      '날씨 일러스트',
                                      style: TextStyle(color: Colors.grey[600]),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: width*0.86,top: height*0.344611),
                  child: Container(
                    width: width*0.11678,
                    height: height*0.03132,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                        "$currentPage / 2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ]
            ),
          ), //상단 화면(banner)
          Container(
            color: Color(ThemeColors.deepNavy),
            width: width,
            height: height*0.06265,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.blueGrey[400],
                  child: Icon(
                    Icons.directions_walk,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '지금까지',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '9230',
                  style: TextStyle(color: Colors.white, fontSize: 9543/width),
                ),
                Text(
                  '걸음',
                  style: TextStyle(color: Colors.white),
                ),
                Image.asset(
                  'assets/line.png',
                  width: 110.0,
                ),
                Text(
                  '2.3',
                  style: TextStyle(
                      color: Colors.white, fontSize: 9543/width, letterSpacing: 5.0),
                ),
                Text(
                  'Km',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ), //중간 걸음수, km 정보
          SizedBox(
            height: height*0.03132,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.048661),
                child: Text(
                  '여행 코스 둘러보기',
                  style: TextStyle(
                    fontSize: 8220/width,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ), //여행 코스 둘러보기
          SizedBox(
            height: height*0.02506,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommonFrame1(title: '여행 코스 둘러보기', clas: TravelCourse())),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/courseImage.png',
                          width: width*0.85158,
                          height: height*0.32581,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height*0.23182),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(ThemeColors.deepNavy),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )),
                          padding: EdgeInsets.symmetric(
                            vertical: height*0.01879,
                            horizontal: width*0.05352,
                          ),
                          width: width*0.85158,
                          //color: Colors.lightBlue[800],
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 출발 춘천역',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.3163,
                                  ),
                                  Text(
                                    '약 43분',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height*0.006265,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 도착 소양로 성당',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.19951,
                                  ),
                                  Text(
                                    '총 2.4km',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset('assets/backShade.png'),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.048661, top: height*0.027568),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '제1코스',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height*0.00626,
                            ),
                            Text(
                              '드라마 주인공처럼',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 0.00626,
                            ),
                            Text(
                              '운치있게 나혼자 사색하기',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.75425, top: height*0.025062),
                        child: Image.asset('assets/heart.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommonFrame1(title: '여행 코스 둘러보기', clas: TravelCourse())),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/courseImage.png',
                          width: width*0.85158,
                          height: height*0.32581,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height*0.23182),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(ThemeColors.deepNavy),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )),
                          padding: EdgeInsets.symmetric(
                            vertical: height*0.01879,
                            horizontal: width*0.05352,
                          ),
                          width: width*0.85158,
                          //color: Colors.lightBlue[800],
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 출발 춘천역',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.3163,
                                  ),
                                  Text(
                                    '약 43분',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height*0.006265,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 도착 소양로 성당',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.19951,
                                  ),
                                  Text(
                                    '총 2.4km',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset('assets/backShade.png'),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.048661, top: height*0.027568),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '제2코스',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height*0.00626,
                            ),
                            Text(
                              '드라마 주인공처럼',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 0.00626,
                            ),
                            Text(
                              '운치있게 나혼자 사색하기',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.75425, top: height*0.025062),
                        child: Image.asset('assets/heart.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommonFrame1(title: '여행 코스 둘러보기', clas: TravelCourse())),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/courseImage.png',
                          width: width*0.85158,
                          height: height*0.32581,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height*0.23182),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(ThemeColors.deepNavy),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )),
                          padding: EdgeInsets.symmetric(
                            vertical: height*0.01879,
                            horizontal: width*0.05352,
                          ),
                          width: width*0.85158,
                          //color: Colors.lightBlue[800],
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 출발 춘천역',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.3163,
                                  ),
                                  Text(
                                    '약 43분',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height*0.006265,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 도착 소양로 성당',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.19951,
                                  ),
                                  Text(
                                    '총 2.4km',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset('assets/backShade.png'),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.048661, top: height*0.027568),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '제3코스',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height*0.00626,
                            ),
                            Text(
                              '드라마 주인공처럼',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 0.00626,
                            ),
                            Text(
                              '운치있게 나혼자 사색하기',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.75425, top: height*0.025062),
                        child: Image.asset('assets/heart.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //코스 종류(수평 슬라이드)
          SizedBox(
            height: height*0.03132,
          ),
          Container(
            color: Colors.grey,
            height: 1.0,
            width: width*0.83454,
          ), //수평선
          SizedBox(
            height: height*0.037593,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.04866),
                child: Text(
                  '여행 전 알아둘 여행꿀팁',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ), //여행전 알아둘 여행꿀팁
          SizedBox(
            height: height*0.025062,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/travelTip1.png',
                        width: width*0.583941,
                        height: width*0.583941,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.04866, top: height*0.02756),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '여기가 바로 인생 포토존',
                              style: TextStyle(
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '춘천 7월 포토스팟 모음집',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/travelTip2.png',
                          width: width*0.583941,
                          height: width*0.583941,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width*0.04866, top: height*0.02756),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '핫하다는 카페만 모았다',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '춘천 신상 카페 리스트',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //여행전 알아둘 여행꿀팁(수평 슬라이드)
          SizedBox(
            height: height*0.031328,
          ),
          Container(
            color: Colors.grey,
            width: width*0.83454,
            height: 1.0,
          ), //수평선
          SizedBox(
            height: height*0.032581,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.04866),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GROAD'S PICK",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(ThemeColors.deepNavy),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '이번주 인기 맛집',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ), //GROAD'S PICK 이번주 인기 맛집
          SizedBox(
            height: height*0.02506,
          ),
          Container(
            height: height*0.28822,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(left:width*0.02433),
                  child: FoodStoreItem(
                    popularFoodStore: foodList[index],
                  ),
                );
              },
            ),
          ), //이번 주 인기 맛집 종류(수평 슬라이드)
          SizedBox(
            height: height*0.05012,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.048661),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GROAD'S PICK",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(ThemeColors.deepNavy),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '이번주 인기 숙소',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ), //GROAD'S PICK 이번주 인기 숙소
          SizedBox(
            height: height*0.025062,
          ),
          Container(
            height: height*0.28822,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: PopularRoomList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(left:width*0.02433),
                  child: RoomItem(
                    popularRoom: PopularRoomList[index],
                  ),
                );
              },
            ),
          ), //이번 주 인기 숙소 종류(수평 슬라이드)
          SizedBox(
            height: height*0.05012,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: width*0.34063, left: width*0.04866),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '여행자들의 후기',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.07299),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color(ThemeColors.deepNavy),
                    ),
                  ),
                ),
              ),
            ],
          ), //여행자들의 후기
          SizedBox(
            height: height*0.02506,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: width*0.6326,
                      height: height*0.30075,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/reviewImage1.png'),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width*0.02433, top: height*0.09398),
                                child: Image.asset('assets/reviewAvatar1.png'),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height*0.006265,
                              horizontal: width*0.036496,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '여행자',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: height*0.00877,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '소양강 스카이워크',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width*0.012165,
                                    ),
                                    Image.asset('assets/star.png')
                                  ],
                                ),
                                Text(
                                  '밑이 유리이기는 하나 잘 안보여요ㅎ 춘천 상품권으로 전액 돌려줘서 좋았어요. 춘...',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width*0.02433,
                ),
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: width*0.6326,
                      height: height*0.30075,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                child: Image.asset(
                                  'assets/reviewImage1.png',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width*0.02433, top: height*0.09398),
                                child: Image.asset('assets/reviewAvatar2.png'),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height*0.006265,
                              horizontal: width*0.036496,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '여행자',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: height*0.00877,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '소양로 성당',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width*0.012165,
                                    ),
                                    Image.asset('assets/star.png')
                                  ],
                                ),
                                Text(
                                  '밑이 유리이기는 하나 잘 안보여요ㅎ 춘천 상품권으로 전액 돌려줘서 좋았어요. 춘...',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), //여행자들의 후기(수평 슬라이드)
          SizedBox(
            height: height*0.05012,
          ),
        ],
      ), //메인스크린
    );
  }
}
