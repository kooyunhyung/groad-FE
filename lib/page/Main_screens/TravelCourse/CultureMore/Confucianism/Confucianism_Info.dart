import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/frame/common_frame2.dart';
import 'Confucianism_Detail.dart';

class Confucianism_InfoPage extends StatelessWidget {
  const Confucianism_InfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 90.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '해당 코스의 유교문화',
                    style: TextStyle(
                      color: Color(ThemeColors.deepNavy),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Container(
                    color: Color(ThemeColors.deepNavy),
                    width: 240.0,
                    height: 3.0,
                  ),
                ],
              ),
            ), //해당 코스의 유교문화
            SizedBox(
              height: 23.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommonFrame2(title: '유교 문화', clas: Confucianism_Detail(),)),
                );
              },
              child: Center(
                child: Container(
                  color: Colors.grey[400],
                  width: screenSize.width * 0.85,
                  height: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '현재 지도 이미지',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '현위치+주변에 유교문화지 위치 표시',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ), //현재 지도 이미지
            SizedBox(
              height: 25.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '    유교문화 소개 타이틀',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '    춘천 지역에는 고려 후기 공적 교육기관이었던 향교가 건립되어 이를 중심으로 유학이 널리 교육되었을 것으로 추측하고 있다. 조선 후기에는 신북읍에 문암서원, 서면의 도포서원, 동면의 구봉서원 등이 건립된 것을 통해 춘천의 유교 문화를 살필 수 있다.',
                  maxLines: 5,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '    또한 1945년 분단 이전까지 춘천에 속했던 화천군 사내면의 화음동정사에는 김수증이 은거하면서 김창흡과 성계헌 등이 관계하고, 서면 현암리 백운단에는 김창흡과 김창협, 그리고 이들과 학맥을 같이하는 여러 유학자들이 깊이 교육하는 장소로 발전하였다.',
                  maxLines: 5,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '    그리고 화서 이항로의 학맥을 계승한 유중교, 유인석, 이소응 등 많은 후기 유학자들이 위정척사를 내세워 항일운동을 선도하여 춘천지역을 항일의병운동의 중심지로 만들었다.',
                  maxLines: 4,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  '    고지도',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ), //글 문구...
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: [
                Image.asset('assets/map1.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '해당위치',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        Text(
                          '고지도 이미지',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          height: 23.0,
                        ),
                        Text(
                          '향교,소양정,위봉문,조양루 표시',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 8.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ), //고지도 이미지
          ],
        ),
      ),
    );
  }
}
