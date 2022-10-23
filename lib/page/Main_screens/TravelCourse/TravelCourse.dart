import 'dart:async';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import '../../frame/common_frame2.dart';
import 'CultureMore/Budda/BuddaInfo.dart';
import 'CultureMore/Confucianism/Confucianism_Info.dart';
import 'PositionPage/Position_YetSanGil/PositionPage_YetSanGil.dart';

class TravelCourse extends StatefulWidget {
  const TravelCourse({Key key}) : super(key: key);

  @override
  State<TravelCourse> createState() => _TravelCourseState();
}

class _TravelCourseState extends State<TravelCourse> {
  String _output = 'Empty Scan Code';
  bool mk1_col_red = true;
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  CameraPosition _cameraPosition =
  CameraPosition(target: LatLng(37.8751681, 127.7444707), zoom: 11.7);

  _TravelCourseState();

  @override
  build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    Marker marker1 = Marker(
      markerId: 'Chuncheon Station',
      position: LatLng(37.8844239, 127.7165788),
      captionText: "춘천역",
      captionColor: mk1_col_red ? Colors.red : Colors.green,
      captionTextSize: 15,
      width: 20,
      height: 30,
    );
    Marker marker2 = Marker(
      markerId: 'Paradise Culture Park',
      position: LatLng(37.8778473, 127.7232115),
      captionText: "낙원 문화 공원",
      captionColor: Colors.red,
      captionTextSize: 13,
      width: 20,
      height: 30,
    );
    Marker marker3 = Marker(
        markerId: 'Juknim-dong Cathedral',
        position: LatLng(37.876364, 127.7270891),
        captionText: "죽림동 성당",
        captionOffset: 10,
        captionColor: Colors.red,
        captionTextSize: 13,
        width: 20,
        height: 30);
    Marker marker4 = Marker(
        markerId: 'Chuncheon Encounter Forest',
        position: LatLng(37.8685332, 127.7227753),
        captionText: "춘천 만남의 숲",
        captionColor: Colors.red,
        captionTextSize: 13,
        width: 20,
        height: 30);
    Marker marker5 = Marker(
        markerId: 'Jiseong Park',
        position: LatLng(37.8679131, 127.7368356),
        captionText: "지성 공원",
        captionColor: Colors.red,
        captionTextSize: 14,
        width: 20,
        height: 30);
    Marker marker6 = Marker(
        markerId: 'Chuncheon National University of Education',
        position: LatLng(37.8590126, 127.7483479),
        captionText: "춘천 교육 대학교",
        captionColor: Colors.red,
        captionTextSize: 15,
        onMarkerTab: _onMarkerTap6,
        width: 20,
        height: 30);
    final pathOverlayId = PathOverlayId("course1");
    List<LatLng> path = [
      LatLng(37.8844239, 127.7165788),
      LatLng(37.8778473, 127.7232115),
      LatLng(37.876364, 127.7270891),
      LatLng(37.8685332, 127.7227753),
      LatLng(37.8679131, 127.7368356),
      LatLng(37.8590126, 127.7483479)
    ];
    final Set<PathOverlay> _pathOverlays = new Set<PathOverlay>();
    _pathOverlays
        .add(PathOverlay(pathOverlayId, path, width: 5, outlineWidth: 1));

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.037593, vertical: height * 0.03759),
            //color: Colors.grey[100],
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.60827),
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
                          height: height * 0.00877,
                        ),
                        Container(
                          color: Color(ThemeColors.deepNavy),
                          width: width * 0.243309,
                          height: 3.0,
                        ),
                      ],
                    ), //1번 코스
                  ),
                  InkWell(
                    onTap: () =>
                        _scan(mk1: marker1.markerId,
                            mk2: marker2.markerId,
                            mk3: marker3.markerId,
                            mk4: marker4.markerId,
                            mk5: marker5.markerId,
                            mk6: marker6.markerId),
                    child: Icon(
                      Icons.qr_code, color: Color(ThemeColors.deepNavy),),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.03132,
              ),
              Center(
                child: Container(
                    width: width * 0.85,
                    height: height * 0.31328,
                    //color: Colors.grey[400],
                    child: NaverMap(
                      //onMapTap: _onMapTap,
                      onMapCreated: onMapCreated,
                      mapType: _mapType,
                      initialCameraPosition: _cameraPosition,
                      markers: [
                        marker1,
                        marker2,
                        marker3,
                        marker4,
                        marker5,
                        marker6
                      ],
                      pathOverlays: _pathOverlays,
                    )),
              ),
            ]),
          ), //해당 코스 지도
          SizedBox(
            height: height * 0.018796,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.048661),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.005012),
                  child: Center(
                    child: Container(
                      color: Color(ThemeColors.lightSky),
                      width: width * 0.81508515,
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
                      width: width * 0.04866,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width * 0.085158,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width * 0.12165,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(ThemeColors.lightSky),
                      size: 10.0,
                    ),
                    SizedBox(
                      width: width * 0.12165,
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
                "낙원 문화 공원",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "죽림동 성당",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "춘천 만남의 숲",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "지성 공원",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "춘천 교육 대학교",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
            ],
          ), //춘천역 옛산길 고개마루에서 직진
          SizedBox(
            height: height * 0.06265,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.048661),
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
            padding: EdgeInsets.symmetric(horizontal: width * 0.02433),
            child: Text(
              '람 사는 냄새가 물씬 풍기는 번개 시장을 스쳐 지나면 해질녘 노',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04136),
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
            padding: EdgeInsets.only(right: width * 0.02433),
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
            height: height * 0.03132,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04866),
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
            height: height * 0.025062,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CommonFrame2(
                          title: '불교문화',
                          clas: BuddaInfoPage(),
                        )),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: width * 0.7274,
                height: height * 0.032581,
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
          SizedBox(
            height: height * 0.00626,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CommonFrame2(
                          title: '유교 문화',
                          clas: Confucianism_InfoPage(),
                        )),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: width * 0.7274,
                height: height * 0.032581,
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
          SizedBox(
            height: height * 0.00626,
          ),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey[400],
                width: width * 0.7274,
                height: height * 0.032581,
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
            height: height * 0.03759,
          )
        ],
      ),
    );
  }

  void _onMarkerTap6(Marker marker, Map<String, int> iconSize) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CommonFrame2(
                title: '불교문화',
                clas: BuddaInfoPage(),
              )),
    );
  }

  Future _scan(
      {String mk1, String mk2, String mk3, String mk4, String mk5, String mk6}) async {
    String barcode = await scanner.scan();
    setState(() {
      if (barcode == mk1){
        mk1_col_red = false;
      }
        _output = barcode;
      print('qrcode: $_output');
    });
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
