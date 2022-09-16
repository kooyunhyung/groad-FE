import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Menu_screens/travelInfo/CultureMore/Budda/Budda.dart';
import 'CultureMore/Confucianism/Confucianism.dart';
import 'PositionPage/Position_YetSanGil/PositionPage_YetSanGil_Main.dart';

class TravelInfo extends StatelessWidget {
  const TravelInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            //color: Colors.grey[100],
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Column(
                  children: [
                    Text(
                      '1번 코스',
                      style: TextStyle(
                        color: Color(deepNavy),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Container(
                      color: Color(deepNavy),
                      width: 100.0,
                      height: 3.0,
                    ),
                  ],
                ), //1번 코스
              ),
              SizedBox(
                height: 25.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PositionPage_YetSanGil_Main()),
                  );
                },
                child: Center(
                  child: Container(
                    width: screenSize.width * 0.85,
                    height: 250.0,
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
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Center(
                    child: Container(
                      color: Color(lightSky),
                      width: 333.0,
                      height: 1.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Color(lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(lightSky),
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
                style: TextStyle(color: Color(deepNavy), fontSize: 12.0),
              ),
              Text(
                "옛산길",
                style: TextStyle(color: Color(deepNavy), fontSize: 12.0),
              ),
              Text(
                "고개마루에서 직진",
                style: TextStyle(color: Color(deepNavy), fontSize: 12.0),
              ),
              Text(
                "미나리폭포",
                style: TextStyle(color: Color(deepNavy), fontSize: 12.0),
              ),
              Text(
                "소양로 성당",
                style: TextStyle(color: Color(deepNavy), fontSize: 12.0),
              ),
            ],
          ), //춘천역 옛산길 고개마루에서 직진
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '람 사는 냄새가 물씬 풍기는 번개 시장을 스쳐 지나면 해질녘 노',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
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
            padding: const EdgeInsets.only(right: 10.0),
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
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '문화 더보기',
                  style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ), //문화 더보기
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuddaPage()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: 299,
                height: 26,
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
          SizedBox(height: 5.0,),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfucianismPage()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: 299,
                height: 26,
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
          SizedBox(height: 5.0),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: 299,
                height: 26,
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
            height: 30.0,
          )
        ],
      ),
    );
  }
}
