import 'dart:async';
import 'package:flutter/services.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/component/dialog/notify_dialog.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import '../../frame/common_frame2.dart';
import 'PositionPage/Position_YetSanGil/PositionPage_YetSanGil.dart';

class TravelCourse1 extends StatefulWidget {
  const TravelCourse1({Key key}) : super(key: key);

  @override
  State<TravelCourse1> createState() => _TravelCourse1State();
}

class _TravelCourse1State extends State<TravelCourse1> {
  List path=[];
  List<LatLng> path_prepared=[];
  String _output = 'Empty Scan Code';
  bool course_flag = false;
  bool mk1_col_red = true;
  bool mk2_col_red = true;
  bool mk3_col_red = true;
  bool mk4_col_red = true;
  bool mk5_col_red = true;
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(37.9232548, 127.6513862), zoom: 10.2);

  //_TravelCourse1State();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      final response = await UserAPI(context: context).getPath_1();
      path = response["route"]["trafast"][0]["path"];

      for(int i=0; i<path.length; i++){
        path_prepared.add(LatLng(path[i][1],path[i][0]));
      }
    });
  }

  @override
  build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Marker marker1 = Marker(
      markerId: 'Happy Meadow Ranch',
      position: LatLng(37.980143, 127.692045),
      captionText: "해피 초원\n목장",
      captionColor: mk1_col_red ? Colors.red : Colors.green,
      captionTextSize: 15,
      width: 20,
      height: 30,
    );
    Marker marker2 = Marker(
      markerId: 'Lee Sang-won Art Museum',
      position: LatLng(37.9679432, 127.5790956),
      captionText: "이상원\n미술관",
      captionColor: mk2_col_red ? Colors.red : Colors.green,
      captionTextSize: 13,
      width: 20,
      height: 30,
    );
    Marker marker3 = Marker(
        markerId: 'Gangwon Provincial Flower Garden',
        position: LatLng(37.9232548, 127.7253862),
        captionText: "강원도립\n화목원",
        captionOffset: 10,
        captionColor: mk3_col_red ? Colors.red : Colors.green,
        captionTextSize: 13,
        width: 20,
        height: 30);
    Marker marker4 = Marker(
        markerId: 'Soyanggang Skywalk',
        position: LatLng(37.8933383, 127.7234127),
        captionText: "소양강\n스카이워크",
        captionColor: mk4_col_red ? Colors.red : Colors.green,
        captionTextSize: 13,
        width: 20,
        height: 30);
    Marker marker5 = Marker(
        markerId: 'Soyanggang Maiden Statue',
        position: LatLng(37.8938973, 127.725276),
        captionText: "소양강\n처녀상",
        captionColor: mk5_col_red ? Colors.red : Colors.green,
        captionTextSize: 14,
        width: 20,
        height: 30);

    final pathOverlayId = PathOverlayId("course1");
    final Set<PathOverlay> _pathOverlays = new Set<PathOverlay>();
    _pathOverlays
        .add(PathOverlay(pathOverlayId, path_prepared, width: 5, outlineWidth: 1));

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.037593, vertical: height * 0.03759),
            //color: Colors.grey[100],
            child: Column(children: [
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
              SizedBox(
                height: height * 0.03132,
              ),
              Center(
                child: Container(
                    width: width * 0.95,
                    height: height * 0.61328,
                    //color: Colors.grey[400],
                    child: NaverMap(
                      onMapCreated: onMapCreated,
                      mapType: _mapType,
                      initialCameraPosition: _cameraPosition,
                      markers: [
                        marker1,
                        marker2,
                        marker3,
                        marker4,
                        marker5,
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
                "해피 초원\n목장",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "이상원\n미술관",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "강원도립\n화목원",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "소양강\n스카이워크",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
              Text(
                "소양강\n처녀상",
                style: TextStyle(
                    color: Color(ThemeColors.deepNavy), fontSize: 12.0),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    course_flag = !course_flag;
                    if (course_flag == false && mk5_col_red == false) {
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '축하드립니다! 코스 주행을 완료하였습니다. \n(포인트 100 적립)');
                      setState(() {
                        mk1_col_red = true;
                        mk2_col_red = true;
                        mk3_col_red = true;
                        mk4_col_red = true;
                        mk5_col_red = true;
                      });
                    } else if (course_flag == false && mk5_col_red == true) {
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다. (스탬프 초기화)');
                      setState(() {
                        mk1_col_red = true;
                        mk2_col_red = true;
                        mk3_col_red = true;
                        mk4_col_red = true;
                        mk5_col_red = true;
                      });
                    } else if (course_flag == true) {
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 시작합니다.');
                    }
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: course_flag
                                  ? ThemeColors.red
                                  : Color(ThemeColors.deepNavy),
                              width: 3)),
                      child: Icon(
                        Icons.directions_walk,
                        color: course_flag
                            ? ThemeColors.red
                            : Color(ThemeColors.deepNavy),
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      course_flag ? '코스 주행 종료' : '코스 주행 시작',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => course_flag
                    ? _scan(
                        mk1: marker1.markerId,
                        mk2: marker2.markerId,
                        mk3: marker3.markerId,
                        mk4: marker4.markerId,
                        mk5: marker5.markerId,
                       )
                    : {},
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: course_flag
                                  ? Color(ThemeColors.deepNavy)
                                  : ThemeColors.gray1,
                              width: 3)),
                      child: Icon(
                        Icons.qr_code,
                        color: course_flag
                            ? Color(ThemeColors.deepNavy)
                            : ThemeColors.gray1,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      '스탬프 QR',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: course_flag
                              ? Color(ThemeColors.deepNavy)
                              : ThemeColors.gray1),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  NotifyDialog.show(context,
                      style: TextStyle(
                          fontSize: 50,
                          color: ThemeColors.black,
                          height: 23 / 18),
                      message: '유의 사항을 지켜주세요.\n\n'
                          '1. 코스 주행을 시작하게 되면 \n시작지점에서부터 시작하여 \n순서대로 코스를 주행해주세요.\n\n'
                          '2. 해당 거점에 도착시 QR 스탬프 \n버튼을 누른 뒤 거점에 \n설치된 QR코드를 찍으면 방문 \n인증이 됩니다. \n인증이 완료되면 지도에 표시된 \n거점 텍스트가 초록색으로 \n변합니다.\n'
                          '(단, 코스 경로 순서대로 찍으\n셔야 하며 중간에 건너뛴 \n거점이 있다면 QR코드를 인식하지 않습니다.)\n\n'
                          '3. 마지막 거점까지 모두 스탬\n프를 찍고 난뒤 코스 주행 \n종료 버튼을 누르면 코스 주행이 완료 \n되며 적립 포인트가 지급 됩니다.\n'
                          '(단, 코스를 완료하지 않은 상태\n에서 중간에 종료를 하게 \n되면 그동안의 스탬프 기록은 모두 \n초기화 됩니다.)');
                },
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Color(ThemeColors.deepNavy), width: 3)),
                      child: Icon(
                        Icons.question_mark,
                        color: Color(ThemeColors.deepNavy),
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      '도움말',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
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
          builder: (context) => CommonFrame2(
                title: '여행 코스 둘러보기',
                clas: PositionPage_YetSanGil(),
              )),
    );
  }

  Future _scan(
      {String mk1,
      String mk2,
      String mk3,
      String mk4,
      String mk5,}) async {
    String barcode = await scanner.scan();
    setState(() {
      if (barcode == mk1) {
        mk1_col_red = false;
        return;
      }
      if (mk1_col_red == false && barcode == mk2) {
        mk2_col_red = false;
        return;
      }
      if (mk2_col_red == false && barcode == mk3) {
        mk3_col_red = false;
        return;
      }
      if (mk3_col_red == false && barcode == mk4) {
        mk4_col_red = false;
        return;
      }
      if (mk4_col_red == false && barcode == mk5) {
        mk5_col_red = false;
        return;
      }
      NotifyDialog.show(context,
          style: TextStyle(
              fontSize: 50, color: ThemeColors.black, height: 23 / 18),
          message: '유효하지 않는 값이 입력되었습니다.');
    });
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
