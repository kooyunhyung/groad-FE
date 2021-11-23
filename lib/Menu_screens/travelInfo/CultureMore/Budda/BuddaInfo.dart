import 'package:flutter/material.dart';
import 'package:gload_app/Main_screens/theme.dart';
import 'package:gload_app/Menu_screens/travelInfo/CultureMore/Budda/Budda_DetailPage1.dart';

import 'Budda_Detail.dart';

class BuddaInfoPage extends StatelessWidget {
  const BuddaInfoPage({Key? key}) : super(key: key);

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
                    '해당 코스의 불교문화',
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
                    width: 240.0,
                    height: 3.0,
                  ),
                ],
              ),
            ), //해당 코스의 불교문화
            SizedBox(
              height: 23.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Budda_DetailPage()),
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
                        '현위치+주변에 불교문화지 위치 표시',
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
                  '    춘천 불교 개설',
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
                  '     강원 지역에는 신라시대에 불교가 전래되어 많은 사찰이 건립되었고, 건립된 사찰을 중심으로 불교문화가 꽃피웠다. 그러나 강원지역은 1945년 남북으로 분단될 때 그 경계선상에 위치하고 있었으며, 휴전을 전후한 시기에는 남북한의 격전지었기 때문에 강원도 내의 3개 본사였던 유점사,건봉사,월정사가 모두 폭격과 방화로 소실되었고, 청평사,낙산사,심곡사를 비롯한 많은 사찰이 폐허가 되는 큰 피해를 입었다. 그리하여 현재는 폐찰되어 절터로만 남아있는 경우가 많다.',
                  maxLines: 8,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '     불교가 춘천지역에 전래된 것을 알 수 있는 가장 이른 시기의 자료는 굴산산문의 범일국사 제자인 낭공이 삭주에 건자야를 짓고, 처음으로 굴산문을 개산하여 불교를 전래한 것으로 알려져 있다. 건자야의 위치는 밝혀지지 않았으나, 춘천지역에서 신라 말의 불교유적으로 보이는 대규모 절터는 용화산 양통마을에 있는 법화사지이다.',
                  maxLines: 6,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '     이후에는 청평사가 창건되어 춘천 불교의 중심지가 되었다. 또한 고려시대에는 양화사,상원사,흥국사,법화사,전방사,조면사 등이 창건되어 번창하였으며 절 이름은 알 수 없지만 소양로 7층 석탑,근화동 당간지주가 있는 곳과 물로리 등에 사찰이 있어서 각 지역에 불교문화를 꽃피웠다. 조선시대에는 우두사,사자사,삼화사,삼한골에 여러 사찰들이 건립되어 이 지역에도 불교 문화가 자리하게 되었다.',
                  maxLines: 7,
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
            ),    //글 문구...
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
                          '소양로 7층 석탑,근화동 당간지주,청평사,서상리 삼층 석탑을 점으로 표시',
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
            ),    //고지도 이미지
          ],
        ),
      ),
    );
  }
}
