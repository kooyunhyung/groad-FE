import 'package:flutter/material.dart';

import '../../../constant/theme.dart';

class DigitalPassport extends StatefulWidget {
  DigitalPassport({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  _DigitalPassportState createState() => _DigitalPassportState();
}

class _DigitalPassportState extends State<DigitalPassport> {
  int coursePage;
  String contents1 = '제 1코스인 춘천 사색의 길은 이상원 미술관에서 출발해 해피초원목장, 강원도립화목원, 소양강스카이워크을 거쳐 소양강처녀상에 마지막으로 도착하는 코스입니다. 총 32.1Km로 교통버스 이용 기준 1시간 40분 소요됩니다.';
  String contents2 = '제 2코스인 의암 순례길은 의암호 스카이워크에서 출발해 킹카누 나루터, 삼악산 호수케이블카, KT&G 상상마당 춘천 아트센터를 거쳐 레고랜드에 마지막으로 도착하는 코스입니다. 총 16.9Km로 교통버스 이용 기준 1시간 30분 소요됩니다.';
  String contents3 = '제 3코스인 문물과 유적의 길은 김유정 문학촌에서 출발해 책과인쇄박물관, 강촌레일파크, 육림고개를 거쳐 국립춘천박물관에 마지막으로 도착하는 코스입니다. 총 14.2Km로 교통버스 이용 기준 1시간 55분 소요됩니다.';
  String contents4 = '제 4코스인 소양강 자연의 길은 청평사에서 출발해 소양강 기념탑, 구봉산전망대카페거리, 낭만시장을 거쳐 명동닭갈비골목에 마지막으로 도착하는 코스입니다. 총 41.6Km로 교통버스 이용 기준 1시간 16분 소요됩니다.';
  String contents5 = '제 5코스인 아이어른 봄내길은 춘천역에서 출발해 애니메이션박물관, 춘천인형극장, 공지천유원지를 거쳐 봉황대에 마지막으로 도착하는 코스입니다. 총 24Km로 교통버스 이용 기준 3시간 25분 소요됩니다.';
  String contents6 = '제 6코스인 춘천 단풍의 길은 강원도립화목원에서 출발해 수변공원길, 김유정역(폐역), 강촌레일파크를 거쳐 남이섬에 마지막으로 도착하는 코스입니다. 총 40.4Km로 교통버스 이용 기준 2시간 22분 소요됩니다.';
  String contents7 = '제 7코스인 시내 한바퀴 길은 춘천역에서 출발해 춘천풍물시장, 낭만골목, 봉의산을 거쳐 소양강스카이워크에 마지막으로 도착하는 코스입니다. 총 8.2Km로 교통버스 이용 기준 2시간 5분 소요됩니다.';
  String contents8 = '제 8코스인 공지천 산책의 길은 공지천 조각공원에서 출발해 공지교, 남춘천교, 석사교를 거쳐 거두교에 마지막으로 도착하는 코스입니다. 총 4.3Km로 도보 이용 기준 1시간 6분 소요됩니다.';
  String contents9 = '제 9코스인 참전 역사의 길은 춘천역에서 출발해 소양강스카이워크, 춘천대첩기념평화공원, 공지천유원지를 거쳐 에티오피아 기념관에 마지막으로 도착하는 코스입니다. 총 4.9Km로 교통버스 이용 기준 1시간 3분 소요됩니다.';
  bool flag = false;

  @override
  void initState() {
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    coursePage = 1;
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
            AnimatedCrossFade(
                firstChild: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.07, right: height * 0.03),
                      child: Stack(
                        children: [
                          Container(
                            child: widget.themeColor == 0
                                ? Image.asset('assets/Rectangle _blue.png')
                                : widget.themeColor == 1
                                    ? Image.asset('assets/Rectangle_green.png')
                                    : Image.asset(
                                        'assets/Rectangle_orange.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.6, top: height * 0.1),
                            child: Image.asset('assets/Vector.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.365, top: height * 0.21),
                            child: Image.asset('assets/GROAD.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.45, top: height * 0.28),
                            child: Image.asset('assets/DigitalPassport.png'),
                          )
                        ],
                      ),
                    ),
                    coursePage == 1
                        ? _passportInfo(1, contents1, width, height)
                        : coursePage == 2
                            ? _passportInfo(2, contents2, width, height)
                            : coursePage == 3
                                ? _passportInfo(3, contents3, width, height)
                                : coursePage == 4
                                    ? _passportInfo(4, contents4, width, height)
                                    : coursePage == 5
                                        ? _passportInfo(
                                            5, contents5, width, height)
                                        : coursePage == 6
                                            ? _passportInfo(
                                                6, contents6, width, height)
                                            : coursePage == 7
                                                ? _passportInfo(
                                                    7, contents7, width, height)
                                                : coursePage == 8
                                                    ? _passportInfo(
                                                        8,
                                                        contents8,
                                                        width,
                                                        height)
                                                    : _passportInfo(
                                                        9,
                                                        contents9,
                                                        width,
                                                        height)
                  ],
                ),
                secondChild: Stack(
                  children: [
                    coursePage == 1
                        ? _passportInfo(1, contents1, width, height)
                        : coursePage == 2
                            ? _passportInfo(2, contents2, width, height)
                            : coursePage == 3
                                ? _passportInfo(3, contents3, width, height)
                                : coursePage == 4
                                    ? _passportInfo(4, contents4, width, height)
                                    : coursePage == 5
                                        ? _passportInfo(
                                            5, contents5, width, height)
                                        : coursePage == 6
                                            ? _passportInfo(
                                                6, contents6, width, height)
                                            : coursePage == 7
                                                ? _passportInfo(
                                                    7, contents7, width, height)
                                                : coursePage == 8
                                                    ? _passportInfo(
                                                        8,
                                                        contents8,
                                                        width,
                                                        height)
                                                    : _passportInfo(
                                                        9,
                                                        contents9,
                                                        width,
                                                        height),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.07, right: height * 0.03),
                      child: Stack(
                        children: [
                          Container(
                            child: widget.themeColor == 0
                                ? Image.asset('assets/Rectangle _blue.png')
                                : widget.themeColor == 1
                                    ? Image.asset('assets/Rectangle_green.png')
                                    : Image.asset(
                                        'assets/Rectangle_orange.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.6, top: height * 0.1),
                            child: Image.asset('assets/Vector.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.365, top: height * 0.21),
                            child: Image.asset('assets/GROAD.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.45, top: height * 0.28),
                            child: Image.asset('assets/DigitalPassport.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.7, top: height * 0.33),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  flag = true;
                                });
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ThemeColors.gray1,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                crossFadeState:
                    flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300)),
            SizedBox(height: height*0.005,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('모바일 패스포트', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),),
                  SizedBox(height: height*0.02,),
                  Text('GROAD 모바일 패스포트는 춘천 관광 길의 정확한 GPS 트랙 정보를 실시간으로 확인 가능하며, 코스별 시작점, 종점 QR 스탬프를 적립 및 코스별 완주 리뷰를 작성할 수 있습니다.',style: TextStyle(color: Colors.grey),),
                  SizedBox(height: height*0.02,),
                  Text('구입 안내', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      Text('구매 방법 : '),
                      Text('GROAD APP 내에서 구매',style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Row(
                    children: [
                      Text('가격: '),
                      Text('20,000원',style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  SizedBox(height: height*0.07,)
                ],
              ),
            )
          ],
        ));
  }

  Widget _passportInfo(
      int courseNumber, String contents, double width, double height) {
    return Padding(
        padding: EdgeInsets.only(left: width * 0.08, top: height * 0.016),
        child: Stack(
          children: [
            Image.asset('assets/Rectangle_content.png'),
            Image.asset('assets/Rectangle_title.png'),
            Padding(
              padding: EdgeInsets.only(left: width * 0.07, top: height * 0.15),
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.31, top: height * 0.15),
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.55, top: height * 0.15),
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.18, top: height * 0.26),
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.43, top: height * 0.26),
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: width * 0.123,
                  top: height * 0.186,
                ),
                child: Container(
                  width: width * 0.17,
                  height: height * 0.08,
                  child: Image.asset('assets/stamp.png'),
                )
                ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.1, top: height * 0.4),
              child: Container(
                width: width * 0.69,
                height: height * 0.25,
                child: Text(contents),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.35, top: height * 0.045),
              child: Text(
                '$courseNumber 코스',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.gray1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.16, top: height * 0.57),
              child: Row(
                children: [
                  coursePage == 1
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 2
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 3
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 4
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 5
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 6
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 7
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 8
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                  coursePage == 9
                      ? Icon(
                          Icons.circle,
                          color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                        )
                      : Icon(
                          Icons.circle,
                          color: ThemeColors.gray1,
                        ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, top: height * 0.05),
              child: GestureDetector(
                  onTap: () {
                    if (coursePage > 1) {
                      setState(() {
                        coursePage -= 1;
                      });
                    }
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ThemeColors.gray1,
                    size: 30,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.70, top: height * 0.05),
              child: GestureDetector(
                  onTap: () {
                    if (coursePage < 9) {
                      setState(() {
                        coursePage += 1;
                      });
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: ThemeColors.gray1,
                    size: 30,
                  )),
            )
          ],
        ));
  }
}
