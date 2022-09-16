import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Menu_screens/travelInfo/PositionPage/Position_YetSanGil/SurroundingInfo/SurroundingInfo1_YetSanGil_Main.dart';

import 'SurroundingInfo/SurroundingInfo2_YetSanGil_Main.dart';
import 'SurroundingInfo/SurroundingInfo3_YetSanGil_Main.dart';

class PositionPage_YetSanGil extends StatelessWidget {
  const PositionPage_YetSanGil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 220.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '옛산길',
                        style: TextStyle(
                          color: Color(deepNavy),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Container(
                      color: Color(deepNavy),
                      width: 128.0,
                      height: 3.0,
                    ),
                  ],
                ),
              ), //옛산길
              SizedBox(
                height: 23.0,
              ),
              Container(
                color: Colors.grey[400],
                width: screenSize.width * 0.9,
                height: 196.0,
                child: Center(
                  child: Text(
                    '메인 이미지',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ), //메인 이미지
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 115.0,
                    height: 71.0,
                    color: Colors.grey[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '서브 이미지1',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 115.0,
                    height: 71.0,
                    color: Colors.grey[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '서브 이미지2',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 115.0,
                    height: 71.0,
                    color: Colors.grey[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '서브 이미지3',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ), //서브 이미지
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 58.0,
                  ),
                  child: Container(
                    width: 40,
                    height: 37,
                    color: Colors.grey[200],
                  ),
                ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "춘천역",
                        style:
                            TextStyle(color: Color(deepNavy), fontSize: 12.0),
                      ),
                      Text(
                        "옛산길",
                        style:
                            TextStyle(color: Color(deepNavy), fontSize: 12.0),
                      ),
                      Text(
                        "고개마루에서 직진",
                        style:
                            TextStyle(color: Color(deepNavy), fontSize: 12.0),
                      ),
                      Text(
                        "미나리폭포",
                        style:
                            TextStyle(color: Color(deepNavy), fontSize: 12.0),
                      ),
                      Text(
                        "소양로 성당",
                        style:
                            TextStyle(color: Color(deepNavy), fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //코스 선(그림)
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 260.0),
            child: Text(
              '정의 및 역사',
              style: TextStyle(
                color: Color(deepNavy),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ), //정의 및 역사
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 18,
              child: Center(
                child: Text(
                  '텍스트',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ), //텍스트 상자
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 18,
              child: Center(
                child: Text(
                  '텍스트',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ), //텍스트 상자
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 18,
              child: Center(
                child: Text(
                  '텍스트',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ), //텍스트 상자
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 18,
              child: Center(
                child: Text(
                  '텍스트',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ), //텍스트 상자
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 18,
              child: Center(
                child: Text(
                  '텍스트',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ), //텍스트 상자
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280.0),
            child: Text(
              '교통 정보',
              style: TextStyle(
                color: Color(deepNavy),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ), //교통정보
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.grey[400],
            width: screenSize.width * 0.9,
            height: 240,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '택시',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              '픽토그램',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ), //택시 픽토그램
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '콜택시 번호',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                        ),
                      ) //콜택시 번호
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '버스',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              '픽토그램',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ), //버스 픽토그램
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: Colors.grey[200],
                        width: screenSize.width * 0.68,
                        height: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.0,vertical: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '21번',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ), //21번
                                        Text(
                                          '소요시간',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.0,
                                          ),
                                        ), //소요시간
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[700],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              width: 40,
                                              height: 15,
                                              child: Center(
                                                child: Text(
                                                  '출발지',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ), //출발지
                                            Stack(
                                              children: [
                                                Container(
                                                  color: Colors.grey[700],
                                                  width: 130,
                                                  height: 3.0,
                                                ), //선
                                                Container(
                                                  //color: Colors.grey[700],
                                                  width: 130,
                                                  height: 0.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                    ],
                                                  ),
                                                ), //점
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[700],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              width: 40,
                                              height: 15,
                                              child: Center(
                                                child: Text(
                                                  '도착지',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ), //도착지
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.grey,
                                              width: 45.0,
                                              height: 30.0,
                                              child: Center(
                                                child: Text(
                                                  '세부설명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 120.0,),
                                            Container(
                                              color: Colors.grey,
                                              width: 45.0,
                                              height: 30.0,
                                              child: Center(
                                                child: Text(
                                                  '세부설명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 30.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '21번',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ), //21번
                                        Text(
                                          '소요시간',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.0,
                                          ),
                                        ), //소요시간
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[700],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)),
                                              width: 40,
                                              height: 15,
                                              child: Center(
                                                child: Text(
                                                  '출발지',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ), //출발지
                                            Stack(
                                              children: [
                                                Container(
                                                  color: Colors.grey[700],
                                                  width: 130,
                                                  height: 3.0,
                                                ), //선
                                                Container(
                                                  //color: Colors.grey[700],
                                                  width: 130,
                                                  height: 0.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                    ],
                                                  ),
                                                ), //점
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[700],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)),
                                              width: 40,
                                              height: 15,
                                              child: Center(
                                                child: Text(
                                                  '도착지',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ), //도착지
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.grey,
                                              width: 45.0,
                                              height: 30.0,
                                              child: Center(
                                                child: Text(
                                                  '세부설명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 120.0,),
                                            Container(
                                              color: Colors.grey,
                                              width: 45.0,
                                              height: 30.0,
                                              child: Center(
                                                child: Text(
                                                  '세부설명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 30.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '21번',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ), //21번
                                        Text(
                                          '소요시간',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.0,
                                          ),
                                        ), //소요시간
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[700],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)),
                                              width: 40,
                                              height: 15,
                                              child: Center(
                                                child: Text(
                                                  '출발지',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ), //출발지
                                            Stack(
                                              children: [
                                                Container(
                                                  color: Colors.grey[700],
                                                  width: 130,
                                                  height: 3.0,
                                                ), //선
                                                Container(
                                                  //color: Colors.grey[700],
                                                  width: 130,
                                                  height: 0.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        size: 8.0,
                                                      ),
                                                    ],
                                                  ),
                                                ), //점
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[700],
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)),
                                              width: 40,
                                              height: 15,
                                              child: Center(
                                                child: Text(
                                                  '도착지',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ), //도착지
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.grey,
                                              width: 45.0,
                                              height: 30.0,
                                              child: Center(
                                                child: Text(
                                                  '세부설명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 120.0,),
                                            Container(
                                              color: Colors.grey,
                                              width: 45.0,
                                              height: 30.0,
                                              child: Center(
                                                child: Text(
                                                  '세부설명',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),  //교통 정보 내용...
          SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.only(right: 280.0),
            child: Text(
              '주변 정보',
              style: TextStyle(
                color: Color(deepNavy),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ), //주변정보
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurroundingInfo1_YetSanGil_Main()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 115.0,
                      height: 71.0,
                      color: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '주변 이미지1',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.0,),
                    Text('안녕하세요',style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurroundingInfo2_YetSanGil_Main()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 115.0,
                      height: 71.0,
                      color: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '주변 이미지2',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.0,),
                    Text('주변 이미지 타이틀',style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurroundingInfo3_YetSanGil_Main()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 115.0,
                      height: 71.0,
                      color: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '주변 이미지',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.0,),
                    Text('주변 이미지 타이틀',style: TextStyle(color: Colors.black),)
                  ],
                ),
              )
            ],
          ),  //주변 이미지 1 2 3
          SizedBox(height: 30.0,)
        ],
      ),
    );
  }
}
