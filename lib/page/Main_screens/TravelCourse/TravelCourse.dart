import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import '../../frame/common_frame2.dart';
import 'CultureMore/Budda/BuddaInfo.dart';
import 'CultureMore/Confucianism/Confucianism_Info.dart';
import 'PositionPage/Position_YetSanGil/PositionPage_YetSanGil.dart';

class TravelCourse extends StatelessWidget {
  const TravelCourse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.037593, vertical: height*0.03759),
            //color: Colors.grey[100],
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(right: width*0.60827),
                child: Column(
                  children: [
                    Text(
                      '1번 코스',
                      style: TextStyle(
                        color: Color(ThemeColors.deepNavy),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height*0.00877,
                    ),
                    Container(
                      color: Color(ThemeColors.deepNavy),
                      width: width*0.243309,
                      height: 3.0,
                    ),
                  ],
                ), //1번 코스
              ),
              SizedBox(
                height: height*0.03132,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommonFrame2(title: '해당 코스', clas: PositionPage_YetSanGil(),)),
                  );
                },
                child: Center(
                  child: Container(
                    width: width * 0.85,
                    height: height*0.31328,
                    color: Colors.grey[400],
                    child: Center(
                      child: Text(
                        '해당 코스 지도',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ), //해당 코스 지도
          SizedBox(
            height: height*0.018796,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.048661),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height*0.005012),
                  child: Center(
                    child: Container(
                      color: Color(ThemeColors.lightSky),
                      width: width*0.81508515,
                      height: 1.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width*0.04866,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width*0.085158,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width*0.12165,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width*0.12165,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                  ],
                )
              ],
            ),
          ), //코스 선(그림)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "춘천역",
                style: TextStyle(color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "옛산길",
                style: TextStyle(color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "고개마루에서 직진",
                style: TextStyle(color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "미나리폭포",
                style: TextStyle(color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "소양로 성당",
                style: TextStyle(color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
            ],
          ), //춘천역 옛산길 고개마루에서 직진
          SizedBox(
            height: height*0.06265,
          ),
          Padding(
            padding: EdgeInsets.only(left: width*0.048661),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '"',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  '깊',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  '고 푸른 소양강변을 따라 마음의 짐을 한 움큼 덜어내고, 사',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02433),
            child: Text(
              '람 사는 냄새가 물씬 풍기는 번개 시장을 스쳐 지나면 해질녘 노',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width*0.04136),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '을처럼 낮지만 기다란 둔덕이 나타난다.(간단한 설명',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width*0.02433),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '"',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ), //글귀
          SizedBox(
            height: height*0.03132,
          ),
          Padding(
            padding: EdgeInsets.only(left: width*0.04866),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '문화 더보기',
                  style: TextStyle(
                    color: Color(ThemeColors.deepNavy),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ), //문화 더보기
          SizedBox(
            height: height*0.025062,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommonFrame2(title:'불교문화', clas: BuddaInfoPage(),)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: width*0.7274,
                height: height*0.032581,
                child: Center(
                  child: Text(
                    '불교문화',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height*0.00626,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommonFrame2(title: '유교 문화', clas: Confucianism_InfoPage(),)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: width*0.7274,
                height: height*0.032581,
                child: Center(
                  child: Text(
                    '유교문화',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height*0.00626,),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: width*0.7274,
                height: height*0.032581,
                child: Center(
                  child: Text(
                    '현대 콘텐츠',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height*0.03759,
          )
        ],
      ),
    );
  }
}
