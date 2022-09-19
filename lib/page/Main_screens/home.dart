import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/components/food_store_item.dart';
import 'package:gload_app/models/popular_food_store.dart';
import 'package:gload_app/models/popular_room.dart';
import 'package:gload_app/page/frame/common_frame1.dart';
import 'components/room_item.dart';
import '../../constant/theme.dart';
import 'TourCourse/TourCourse.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            width: 420,
            height: 306,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage=value+1;
                    });
                  },
                  children: [
                    Stack(children: [
                      Container(
                        color: Colors.lightBlue[50],
                        width: 420,
                        height: 306,
                        child: Container(
                          padding: EdgeInsets.only(top: 145, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '나를 찾기 위해 걷는',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '마음의 길',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    color: Color(deepNavy),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ), //'나를 찾기 위해 걷는 마음의 길'
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 164.0, top: 75.0),
                        child: Image.asset(
                          'assets/character.png',
                        ),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: 293.5, top: 4.3),
                        child: Image.asset('assets/1.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: 32.4, top: 20.6),
                        child: Image.asset('assets/2.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: 96.9, top: 68.5),
                        child: Image.asset('assets/3.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: 10.3, top: 114.6),
                        child: Image.asset('assets/4.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: 2.4, top: 221.3),
                        child: Image.asset('assets/5.png'),
                      ), //데코레이션
                      Padding(
                        padding: EdgeInsets.only(left: 100.6, top: 240),
                        child: Image.asset('assets/6.png'),
                      ), //데코레이션
                    ]),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: 420.0,
                      height: 306.0,
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
                                  color: Color(deepNavy),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 100,),
                              Text(
                                '26 ℃',
                                style: TextStyle(
                                  color: Color(deepNavy),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
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
                              SizedBox(width: 50.0,),
                              Container(
                                width: 124,
                                height: 124,
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
                  padding: const EdgeInsets.only(left: 340.0,top: 275.0),
                  child: Container(
                    width: 48,
                    height: 25,
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
            color: Color(deepNavy),
            width: 420,
            height: 50,
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
                  style: TextStyle(color: Colors.white, fontSize: 23.0),
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
                      color: Colors.white, fontSize: 23.0, letterSpacing: 5.0),
                ),
                Text(
                  'Km',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ), //중간 걸음수, km 정보
          SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '여행 코스 둘러보기',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommonFrame1(title: '여행 코스 둘러보기', clas: TourCourse(),)));
                    });
                  },
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color(deepNavy),
                    ),
                  ),
                ),
              ),
            ],
          ), //여행 코스 둘러보기
          SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/courseImage.png',
                          width: 350,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 185),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(deepNavy),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )),
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 22.0,
                          ),
                          width: 350,
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
                                    width: 130.0,
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
                                height: 5.0,
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
                                    width: 82.0,
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
                        padding: const EdgeInsets.only(left: 20.0, top: 22.0),
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
                              height: 5.0,
                            ),
                            Text(
                              '드라마 주인공처럼',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
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
                        padding: const EdgeInsets.only(left: 310.0, top: 20.0),
                        child: Image.asset('assets/heart.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/courseImage.png',
                          width: 350,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 185),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(deepNavy),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )),
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 22.0,
                          ),
                          width: 350,
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
                                    width: 130.0,
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
                                height: 5.0,
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
                                    width: 82.0,
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
                        padding: const EdgeInsets.only(left: 20.0, top: 22.0),
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
                              height: 5.0,
                            ),
                            Text(
                              '드라마 주인공처럼',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
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
                        padding: const EdgeInsets.only(left: 310.0, top: 20.0),
                        child: Image.asset('assets/heart.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //코스 종류(수평 슬라이드)
          SizedBox(
            height: 25.0,
          ),
          Container(
            color: Colors.grey,
            height: 1.0,
            width: 343.0,
          ), //수평선
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '여행 전 알아둘 여행꿀팁',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color(deepNavy),
                    ),
                  ),
                ),
              ),
            ],
          ), //여행전 알아둘 여행꿀팁
          SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/travelTip1.png',
                        width: 240,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 22.0),
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
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/travelTip2.png',
                          width: 240,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 22.0),
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
            height: 25.0,
          ),
          Container(
            color: Colors.grey,
            width: 343,
            height: 1.0,
          ), //수평선
          SizedBox(
            height: 26.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 140.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GROAD'S PICK",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(deepNavy),
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
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color(deepNavy),
                    ),
                  ),
                ),
              ),
            ],
          ), //GROAD'S PICK 이번주 인기 맛집
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(left:10),
                  child: FoodStoreItem(
                    popularFoodStore: foodList[index],
                  ),
                );
              },
            ),
          ), //이번 주 인기 맛집 종류(수평 슬라이드)
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 140.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GROAD'S PICK",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(deepNavy),
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
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color(deepNavy),
                    ),
                  ),
                ),
              ),
            ],
          ), //GROAD'S PICK 이번주 인기 숙소
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: PopularRoomList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(left:10),
                  child: RoomItem(
                    popularRoom: PopularRoomList[index],
                  ),
                );
              },
            ),
          ), //이번 주 인기 숙소 종류(수평 슬라이드)
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 140.0, left: 20.0),
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
                padding: const EdgeInsets.only(left: 30.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color(deepNavy),
                    ),
                  ),
                ),
              ),
            ],
          ), //여행자들의 후기
          SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: 260.0,
                      height: 240.0,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/reviewImage1.png'),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 75.0),
                                child: Image.asset('assets/reviewAvatar1.png'),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
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
                                  height: 7.0,
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
                                      width: 5.0,
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
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: 260.0,
                      height: 240.0,
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
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 75.0),
                                child: Image.asset('assets/reviewAvatar2.png'),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
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
                                  height: 7.0,
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
                                      width: 5.0,
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
            height: 40.0,
          ),
        ],
      ), //메인스크린
    );
  }
}
