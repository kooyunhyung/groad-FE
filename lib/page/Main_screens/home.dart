import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/page/Main_screens/TravelCourse/components/travel_course_body.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/components/review_tile_body.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/traveler_review.dart';
import 'package:gload_app/page/Main_screens/cafe_list/cafe_list.dart';
import 'package:gload_app/page/Main_screens/lodging_list/lodging_list.dart';
import 'package:gload_app/page/frame/common_frame2.dart';
import 'package:intl/intl.dart';
import '../../constant/theme.dart';
import 'photo_list/photo_list.dart';
import 'restaurant_list/restaurant_list.dart';

class Home extends StatefulWidget {
  Home({Key key, this.userInfo, this.idKey, this.mapType, this.themeColor})
      : super(key: key);

  dynamic userInfo;
  int idKey;
  int mapType;
  int themeColor;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic courseInfoList;
  dynamic photoInfoList;
  dynamic cafeInfoList;
  dynamic restaurantInfoList;
  dynamic lodgingInfoList;
  dynamic reviewInfoList;
  dynamic userInfo;
  int currentPage;
  Map<String, dynamic> weather;
  String formattedDate;
  String weatherImage;

  @override
  void initState() {
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    currentPage = 1;
    var now = new DateTime.now();
    formattedDate = DateFormat('yyyy년 MM월 dd일').format(now);
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
            child: Stack(children: [
              PageView(
                onPageChanged: (value) {
                  setState(() {
                    if (value == 1) {
                      currentPage += 1;
                    } else {
                      currentPage -= 1;
                    }
                  });
                },
                children: [
                  Stack(children: [
                    Container(
                      color: widget.themeColor == 0
                          ? Colors.lightBlue[50]
                          : widget.themeColor == 1
                              ? Colors.lightGreen[50]
                              : Colors.lime[50],
                      width: width,
                      height: height * 0.3834,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: height * 0.1817, left: width * 0.0486),
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
                                  color: widget.themeColor == 0
                                      ? Color(ThemeColors.deepNavy)
                                      : widget.themeColor == 1
                                          ? ThemeColors.deepGreen
                                          : ThemeColors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ), //'나를 찾기 위해 걷는 마음의 길'
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.399, top: height * 0.09398),
                      child: widget.themeColor == 0
                          ? Image.asset(
                              'assets/character_blue.png',
                            )
                          : Image.asset(
                              'assets/characterGreen.png',
                            ),
                    ), //데코레이션
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.71411, top: height * 0.00538),
                      child: Image.asset('assets/1.png'),
                    ), //데코레이션
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.0788, top: height * 0.02581),
                      child: Image.asset('assets/2.png'),
                    ), //데코레이션
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.2357, top: height * 0.085839),
                      child: Image.asset('assets/3.png'),
                    ), //데코레이션
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02506, top: height * 0.1436),
                      child: Image.asset('assets/4.png'),
                    ), //데코레이션
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.005839, top: height * 0.277318),
                      child: Image.asset('assets/5.png'),
                    ), //데코레이션
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.244768, top: height * 0.300751),
                      child: Image.asset('assets/6.png'),
                    ), //데코레이션
                  ]),
                  Stack(children: [
                    Container(
                      width: width,
                      height: height * 0.38345,
                      child: Image.asset(
                        'assets/background.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.04866),
                      width: width,
                      height: height * 0.38345,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formattedDate,
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
                                  color: ThemeColors.black,
                                  fontSize: 12330 / width,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.2433,
                              ),
                              FutureBuilder(
                                future: _fetchWeather(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData == false) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Error: ${snapshot.error}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      '${snapshot.data["temp"]} ℃',
                                      style: TextStyle(
                                        color: ThemeColors.black,
                                        fontSize: 12330 / width,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02506,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '뜨거운 태양이 내리쬐는 오늘',
                                    style: TextStyle(
                                      color: ThemeColors.white,
                                    ),
                                  ),
                                  Text(
                                    '햇살을 만끽하며 걸어볼까요?',
                                    style: TextStyle(
                                      color: ThemeColors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.11065,
                              ),
                              FutureBuilder(
                                future: _fetchWeather(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData == false) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Error: ${snapshot.error}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: width * 0.2807,
                                      height: width * 0.2807,
                                      child: weatherImage == "clear.png"
                                          ? Image.asset(
                                              'assets/weather/$weatherImage',
                                              scale: 3.5,
                                            )
                                          : weatherImage == "clear2.png"
                                              ? Image.asset(
                                                  'assets/weather/$weatherImage',
                                                  scale: 10,
                                                )
                                              : Image.asset(
                                                  'assets/weather/$weatherImage',
                                                  fit: BoxFit.fill,
                                                ),
                                    );
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ])
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.86, top: height * 0.344611),
                child: Container(
                  width: width * 0.11678,
                  height: height * 0.03132,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "$currentPage / 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
          ), //상단 화면(banner)
          Container(
            color: widget.themeColor == 0
                ? Color(ThemeColors.deepNavy)
                : widget.themeColor == 1
                    ? ThemeColors.deepGreen
                    : ThemeColors.deepOrange,
            width: width,
            height: height * 0.06265,
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
                  style: TextStyle(color: Colors.white, fontSize: 9543 / width),
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
                      color: Colors.white,
                      fontSize: 9543 / width,
                      letterSpacing: 5.0),
                ),
                Text(
                  'Km',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ), //중간 걸음수, km 정보
          SizedBox(
            height: height * 0.03132,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.048661),
                child: Text(
                  '여행 코스 둘러보기',
                  style: TextStyle(
                    fontSize: 8220 / width,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ), //여행 코스 둘러보기
          SizedBox(
            height: height * 0.02506,
          ),
          FutureBuilder(
              future: _fetchCourseInfo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Container(
                      width: width,
                      height: height * 0.25,
                      child: Center(
                          child: Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator())));
                } else if (snapshot.hasError) {
                  return Container(
                    width: width,
                    height: height * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: width,
                    height: height * 0.347,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      ...List.generate(
                          snapshot.data.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TravelCourseBody(
                                  idKey: widget.idKey,
                                  mapType: widget.mapType,
                                  userInfo: widget.userInfo,
                                  themeColor: widget.themeColor,
                                  courseInfo: snapshot.data[index],
                                ),
                              ))
                    ]),
                  );
                }
              }), //코스 종류(수평 슬라이드)
          SizedBox(
            height: height * 0.03132,
          ),
          Container(
            color: Colors.grey,
            height: 1.0,
            width: width * 0.83454,
          ), //수평선
          SizedBox(
            height: height * 0.037593,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.048661),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GROAD'S PICK",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '코스 주변 카페 & 포토스팟 모음집',
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
          ), //여행전 알아둘 여행꿀팁
          SizedBox(
            height: height * 0.025062,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.02433,
                ),
                FutureBuilder(
                    future: _fetchPhotoInfo(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Container(
                            child: Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator())));
                      } else if (snapshot.hasError) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonFrame2(
                                      themeColor: widget.themeColor,
                                      title: '포토스팟 리스트',
                                      clas: ListView(
                                        children: [
                                          ...List.generate(
                                              snapshot.data.length,
                                              (index) => PhotoList(
                                                  mapType: widget.mapType,
                                                  themeColor: widget.themeColor,
                                                  photoInfo:
                                                      snapshot.data[index]))
                                        ],
                                      ))),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/travelTip1.png',
                                width: width * 0.583941,
                                height: width * 0.583941,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.04866,
                                    top: height * 0.02756),
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
                                      '춘천 포토스팟 리스트',
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
                        );
                      }
                    }),
                SizedBox(
                  width: width * 0.02433,
                ),
                FutureBuilder(
                    future: _fetchCafeInfo(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Container(
                            child: Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator())));
                      } else if (snapshot.hasError) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonFrame2(
                                      themeColor: widget.themeColor,
                                      title: '카페 리스트',
                                      clas: ListView(
                                        children: [
                                          ...List.generate(
                                              snapshot.data.length,
                                              (index) => CafeList(
                                                  mapType: widget.mapType,
                                                  themeColor: widget.themeColor,
                                                  cafeInfo:
                                                      snapshot.data[index]))
                                        ],
                                      ))),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/travelTip2.png',
                                  width: width * 0.583941,
                                  height: width * 0.583941,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.04866,
                                    top: height * 0.02756),
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
                        );
                      }
                    })
              ],
            ),
          ), //여행전 알아둘 여행꿀팁(수평 슬라이드)
          SizedBox(
            height: height * 0.031328,
          ),
          Container(
            color: Colors.grey,
            width: width * 0.83454,
            height: 1.0,
          ), //수평선
          SizedBox(
            height: height * 0.032581,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.04866),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GROAD'S PICK",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '코스 주변 맛집 & 숙소 모음집',
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
            height: height * 0.02506,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.02433,
                ),
                FutureBuilder(
                    future: _fetchRestaurantInfo(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Container(
                            child: Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator())));
                      } else if (snapshot.hasError) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonFrame2(
                                      themeColor: widget.themeColor,
                                      title: '맛집 리스트',
                                      clas: ListView(
                                        children: [
                                          ...List.generate(
                                              snapshot.data.length,
                                              (index) => RestaurantList(
                                                  mapType: widget.mapType,
                                                  themeColor: widget.themeColor,
                                                  restaurantInfo:
                                                      snapshot.data[index]))
                                        ],
                                      ))),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/restaurant_background.jpg',
                                  width: width * 0.583941,
                                  height: width * 0.583941,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.04866,
                                    top: height * 0.02756),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '최고의 맛집을 찾아서',
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
                                      '춘천 인기 맛집 리스트',
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
                        );
                      }
                    }),
                SizedBox(
                  width: width * 0.02433,
                ),
                FutureBuilder(
                    future: _fetchLodgingInfo(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Container(
                            child: Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator())));
                      } else if (snapshot.hasError) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonFrame2(
                                      themeColor: widget.themeColor,
                                      title: '숙소 리스트',
                                      clas: ListView(
                                        children: [
                                          ...List.generate(
                                              snapshot.data.length,
                                              (index) => LodgingList(
                                                  mapType: widget.mapType,
                                                  themeColor: widget.themeColor,
                                                  lodgingInfo:
                                                      snapshot.data[index]))
                                        ],
                                      ))),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/lodging_background.jpg',
                                  width: width * 0.583941,
                                  height: width * 0.583941,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.04866,
                                    top: height * 0.02756),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '최고의 숙소를 찾아서',
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
                                      '춘천 인기 숙소 리스트',
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
                        );
                      }
                    })
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05012,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.34063, left: width * 0.04866),
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
                padding: EdgeInsets.only(left: width * 0.07299),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommonFrame2(
                              themeColor: widget.themeColor,
                              title: '여행자들의 후기',
                              clas: TravelerReview(
                                idKey: widget.idKey,
                                themeColor: widget.themeColor,
                              ))),
                    );
                  },
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: widget.themeColor == 0
                          ? Color(ThemeColors.deepNavy)
                          : widget.themeColor == 1
                              ? ThemeColors.deepGreen
                              : ThemeColors.deepOrange,
                    ),
                  ),
                ),
              ),
            ],
          ), //여행자들의 후기
          SizedBox(
            height: height * 0.02506,
          ),
          FutureBuilder(
              future: _fetchReviewInfo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Container(
                      width: width,
                      height: height * 0.25,
                      child: Center(
                          child: Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator())));
                } else if (snapshot.hasError) {
                  return Container(
                    width: width,
                    height: height * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: width,
                    height: height * 0.347,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      ...List.generate(
                          snapshot.data.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ReviewTileBody(
                                  idKey: widget.idKey,
                                  themeColor: widget.themeColor,
                                  userInfo: userInfo,
                                  reviewInfo: snapshot.data[snapshot.data.length-1-index],
                                ),
                              ))
                    ]),
                  );
                }
              }),
          SizedBox(
            height: height * 0.09012,
          ),
        ],
      ), //메인스크린
    );
  }

  Future<dynamic> _fetchCourseInfo() async {
    courseInfoList = await UserAPI(context: context).getTravelCourse();
    print(courseInfoList);
    return courseInfoList;
  }

  Future<dynamic> _fetchReviewInfo() async {
    if (widget.idKey != -1) {
      userInfo = await UserAPI(context: context).getUser(pk: widget.idKey);
    }
    reviewInfoList = await UserAPI(context: context).getReview();
    return reviewInfoList;
  }

  Future<dynamic> _fetchCafeInfo() async {
    cafeInfoList = await UserAPI(context: context).getCafeList();
    return cafeInfoList;
  }

  Future<dynamic> _fetchPhotoInfo() async {
    photoInfoList = await UserAPI(context: context).getPhotoList();
    return photoInfoList;
  }

  Future<dynamic> _fetchRestaurantInfo() async {
    restaurantInfoList = await UserAPI(context: context).getRestaurantList();
    return restaurantInfoList;
  }

  Future<dynamic> _fetchLodgingInfo() async {
    lodgingInfoList = await UserAPI(context: context).getLodgingList();
    print(lodgingInfoList);
    return lodgingInfoList;
  }

  Future<Map<String, dynamic>> _fetchWeather() async {
    weather = await UserAPI(context: context).getWeather_();

    if (weather['main_weather'] == "Thunderstorm") {
      weatherImage = "thunder.png";
    }
    if (weather['main_weather'] == "Drizzle") {
      weatherImage = "showerRain.png";
    }
    if (weather['main_weather'] == "Rain") {
      if (weather['description'] == "freezing rain") {
        weatherImage = "snow.png";
      }
      if (weather['description'] == "light rain" ||
          weather['description'] == "moderate rain" ||
          weather['description'] == "heavy intensity rain" ||
          weather['description'] == "very heavy rain" ||
          weather['description'] == "extreme rain") {
        if (weather['iconId'] == "10d") {
          weatherImage = "rain.png";
        } else if (weather['iconId'] == "10n") {
          weatherImage = "rain2.png";
        }
      }
      if (weather['description'] == "light intensity shower rain" ||
          weather['description'] == "shower rain" ||
          weather['description'] == "heavy intensity shower rain" ||
          weather['description'] == "ragged shower rain") {
        weatherImage = "showerRain.png";
      }
    }
    if (weather['main_weather'] == "Snow") {
      weatherImage = "snow.png";
    }
    if (weather['main_weather'] == "Mist" ||
        weather['main_weather'] == "Smoke" ||
        weather['main_weather'] == "Haze" ||
        weather['main_weather'] == "Dust" ||
        weather['main_weather'] == "Fog" ||
        weather['main_weather'] == "Sand" ||
        weather['main_weather'] == "Ash" ||
        weather['main_weather'] == "Squall" ||
        weather['main_weather'] == "Tornado") {
      weatherImage = "mist+.png";
    }
    if (weather['main_weather'] == "Clear") {
      if (weather['iconId'] == "01d") {
        weatherImage = "clear.png";
      } else if (weather['iconId'] == "01n") {
        weatherImage = "clear2.png";
      }
    }
    if (weather['main_weather'] == "Clouds") {
      if (weather['iconId'] == "02d") {
        weatherImage = "fewClouds.png";
      } else if (weather['iconId'] == "02n") {
        weatherImage = "fewClouds2.png";
      }
      if (weather['iconId'] == "04d" || weather['iconId'] == "04n") {
        weatherImage = "brokenClouds.png";
      } else {
        weatherImage = "clouds.png";
      }
    }

    return weather;
  }
}
