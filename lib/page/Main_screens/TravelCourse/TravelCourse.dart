import 'dart:async';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/component/dialog/notify_dialog.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import '../../frame/common_frame1.dart';
import '../../frame/common_frame2.dart';
import '../home.dart';
import 'PositionPage/position.dart';

class TravelCourse extends StatefulWidget {
  TravelCourse(
      {Key key,
      this.userInfo,
      this.courseInfo,
      this.idKey,
      this.mapType,
      this.themeColor})
      : super(key: key);

  dynamic userInfo;
  dynamic courseInfo;
  int idKey;
  int mapType;
  int themeColor;

  @override
  State<TravelCourse> createState() => _TravelCourseState();
}

class _TravelCourseState extends State<TravelCourse> {
  int courseKey;
  String title;
  double cameraLat;
  double cameraLng;
  String MarkerId1;
  String MarkerId2;
  String MarkerId3;
  String MarkerId4;
  String MarkerId5;
  String startPoint;
  String endPoint;
  String wayPoint1;
  String wayPoint2;
  String wayPoint3;
  double Lat1;
  double Lat2;
  double Lat3;
  double Lat4;
  double Lat5;
  double Lng1;
  double Lng2;
  double Lng3;
  double Lng4;
  double Lng5;
  double zoom;

  int positionKey;
  int flag;
  Set<PathOverlay> _pathOverlays;
  Map<String, dynamic> response;
  List path = [];
  List<LatLng> path_prepared = [];
  bool course_flag = false;
  bool mk1_col_red = true;
  bool mk2_col_red = true;
  bool mk3_col_red = true;
  bool mk4_col_red = true;
  bool mk5_col_red = true;
  Completer<NaverMapController> _controller = Completer();

  int addPoint;
  double addStep;

  //_TravelCourse1State();
  @override
  void initState() {
    addStep=0;
    courseKey = widget.courseInfo["gt_course_key"];
    title = widget.courseInfo["gt_course_title"];
    cameraLat = widget.courseInfo["gt_camera_lat"];
    cameraLng = widget.courseInfo["gt_camera_lng"];
    MarkerId1 = widget.courseInfo["gt_course_Id1"];
    MarkerId2 = widget.courseInfo["gt_course_Id2"];
    MarkerId3 = widget.courseInfo["gt_course_Id3"];
    MarkerId4 = widget.courseInfo["gt_course_Id4"];
    MarkerId5 = widget.courseInfo["gt_course_Id5"];
    startPoint = widget.courseInfo["gt_course_name1"];
    endPoint = widget.courseInfo["gt_course_name5"];
    wayPoint1 = widget.courseInfo["gt_course_name2"];
    wayPoint2 = widget.courseInfo["gt_course_name3"];
    wayPoint3 = widget.courseInfo["gt_course_name4"];
    Lat1 = widget.courseInfo["gt_course_lat1"];
    Lat2 = widget.courseInfo["gt_course_lat2"];
    Lat3 = widget.courseInfo["gt_course_lat3"];
    Lat4 = widget.courseInfo["gt_course_lat4"];
    Lat5 = widget.courseInfo["gt_course_lat5"];
    Lng1 = widget.courseInfo["gt_course_lng1"];
    Lng2 = widget.courseInfo["gt_course_lng2"];
    Lng3 = widget.courseInfo["gt_course_lng3"];
    Lng4 = widget.courseInfo["gt_course_lng4"];
    Lng5 = widget.courseInfo["gt_course_lng5"];
    zoom = widget.courseInfo["gt_zoom"];

    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    if (widget.mapType == null) {
      widget.mapType = 0;
    }
    // TODO: implement initState
    super.initState();
    flag = 0;
    if (courseKey == 1) {
      addPoint = 300;
    } else if (courseKey == 2) {
      addPoint = 250;
    } else if (courseKey == 3) {
      addPoint = 250;
    } else if (courseKey == 4) {
      addPoint = 350;
    } else if (courseKey == 5) {
      addPoint = 300;
    } else if (courseKey == 6) {
      addPoint = 350;
    } else if (courseKey == 7) {
      addPoint = 400;
    } else if (courseKey == 8) {
      addPoint = 200;
    } else if (courseKey == 9) {
      addPoint = 100;
    }
  }

  @override
  build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    CameraPosition _cameraPosition =
        CameraPosition(target: LatLng(cameraLat, cameraLng), zoom: zoom);

    MapType _mapType = widget.mapType == 0
        ? MapType.Basic
        : widget.mapType == 1
            ? MapType.Satellite
            : MapType.Hybrid;

    Marker marker1 = Marker(
      markerId: MarkerId1,
      position: LatLng(Lat1, Lng1),
      captionText: startPoint,
      captionColor: mk1_col_red ? Colors.red : Colors.green,
      captionTextSize: 15,
      width: 20,
      height: 30,
    );
    Marker marker2 = Marker(
      markerId: MarkerId2,
      position: LatLng(Lat2, Lng2),
      captionText: wayPoint1,
      captionColor: mk2_col_red ? Colors.red : Colors.green,
      captionTextSize: 15,
      width: 20,
      height: 30,
    );
    Marker marker3 = Marker(
        markerId: MarkerId3,
        position: LatLng(Lat3, Lng3),
        captionText: wayPoint2,
        captionColor: mk3_col_red ? Colors.red : Colors.green,
        captionTextSize: 15,
        width: 20,
        height: 30);
    Marker marker4 = Marker(
        markerId: MarkerId4,
        position: LatLng(Lat4, Lng4),
        captionText: wayPoint3,
        captionColor: mk4_col_red ? Colors.red : Colors.green,
        captionTextSize: 15,
        width: 20,
        height: 30);
    Marker marker5 = Marker(
        markerId: MarkerId5,
        position: LatLng(Lat5, Lng5),
        captionText: endPoint,
        captionColor: mk5_col_red ? Colors.red : Colors.green,
        captionTextSize: 15,
        width: 20,
        height: 30);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.037593, vertical: height * 0.03759),
          //color: Colors.grey[100],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.00827),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: widget.themeColor == 0
                          ? Color(ThemeColors.deepNavy)
                          : widget.themeColor == 1
                              ? ThemeColors.deepGreen
                              : ThemeColors.deepOrange,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.00877,
                  ),
                  Container(
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.deepNavy)
                        : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                    width: width * 0.343309,
                    height: 4.0,
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
                height: height * 0.42328,
                //color: Colors.grey[400],
                child: FutureBuilder(
                    future: _fetchLatLng(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Center(
                          child: Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      } else {
                        return NaverMap(
                          locationButtonEnable: true,
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
                        );
                      }
                    }),
              ),
            ),
          ]),
        ), //해당 코스 지도
        // SizedBox(
        //   height: height * 0.018796,
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.048661),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.005012),
                child: Center(
                  child: Container(
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                            ? ThemeColors.lightGreen
                            : ThemeColors.lightOrange,
                    width: width * 0.83508515,
                    height: 1.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.circle,
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                            ? ThemeColors.lightGreen
                            : ThemeColors.lightOrange,
                    size: 10.0,
                  ),
                  SizedBox(
                    width: width * 0.08066,
                  ),
                  Icon(
                    Icons.circle,
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                            ? ThemeColors.lightGreen
                            : ThemeColors.lightOrange,
                    size: 10.0,
                  ),
                  SizedBox(
                    width: width * 0.115158,
                  ),
                  Icon(
                    Icons.circle,
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                            ? ThemeColors.lightGreen
                            : ThemeColors.lightOrange,
                    size: 10.0,
                  ),
                  SizedBox(
                    width: width * 0.12165,
                  ),
                  Icon(
                    Icons.circle,
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                            ? ThemeColors.lightGreen
                            : ThemeColors.lightOrange,
                    size: 10.0,
                  ),
                  SizedBox(
                    width: width * 0.12165,
                  ),
                  Icon(
                    Icons.circle,
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                            ? ThemeColors.lightGreen
                            : ThemeColors.lightOrange,
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
            InkWell(
              onTap: () {
                setState(() {
                  positionKey = 0;
                });
                _positionTap1();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                decoration: BoxDecoration(
                  color: ThemeColors.gray1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    startPoint,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : Color(0xFFB8860B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  positionKey = 1;
                });
                _positionTap2();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                decoration: BoxDecoration(
                  color: ThemeColors.gray1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    wayPoint1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : Color(0xFFB8860B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  positionKey = 2;
                });
                _positionTap3();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                decoration: BoxDecoration(
                  color: ThemeColors.gray1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    wayPoint2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : Color(0xFFB8860B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  positionKey = 3;
                });
                _positionTap4();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                decoration: BoxDecoration(
                  color: ThemeColors.gray1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    wayPoint3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : Color(0xFFB8860B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  positionKey = 4;
                });
                _positionTap5();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                decoration: BoxDecoration(
                  color: ThemeColors.gray1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    endPoint,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : Color(0xFFB8860B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.053,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () async {
                if (widget.idKey == -1) {
                  NotifyDialog.show(context,
                      style: TextStyle(
                          fontSize: 40,
                          color: ThemeColors.black,
                          height: 23 / 18),
                      message: '로그인을 하신 후 이용할 수 있습니다.');
                } else {
                  setState(() {
                    course_flag = !course_flag;
                    flag = 1;
                  });
                  if (course_flag == false) {
                    if (mk1_col_red == true) {
                      print("여기도 안될까 설마??");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommonFrame1(
                                    idKey: widget.idKey,
                                    themeColor: widget.themeColor,
                                    title: "GROAD",
                                    clas: Home(
                                      idKey: widget.idKey,
                                      mapType: widget.mapType,
                                      themeColor: widget.themeColor,
                                    ),
                                  )),
                          (route) => false);
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다.');
                    } else if (mk2_col_red == true) {
                      print("여기도2 안될까 설마??");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommonFrame1(
                                    idKey: widget.idKey,
                                    themeColor: widget.themeColor,
                                    title: "GROAD",
                                    clas: Home(
                                      idKey: widget.idKey,
                                      mapType: widget.mapType,
                                      themeColor: widget.themeColor,
                                    ),
                                  )),
                          (route) => false);
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다.');
                    } else if (mk3_col_red == true) {
                      print("여기도 안 되니???");
                      if (courseKey == 1) {
                        addStep = 15.8;
                      } else if (courseKey == 2) {
                        addStep = 2.8;
                      } else if (courseKey == 3) {
                        addStep = 1.3;
                      } else if (courseKey == 4) {
                        addStep = 14.2;
                      } else if (courseKey == 5) {
                        addStep = 10.1;
                      } else if (courseKey == 6) {
                        addStep = 7.3;
                      } else if (courseKey == 7) {
                        addStep = 2.1;
                      } else if (courseKey == 8) {
                        addStep = 1.4;
                      } else if (courseKey == 9) {
                        addStep = 1.4;
                      }
                      await UserAPI(context: context).updateUser(
                          pk: widget.idKey,
                          id: widget.userInfo['gu_id'],
                          pw: widget.userInfo['gu_pw'],
                          name: widget.userInfo['gu_name'],
                          gender: widget.userInfo['gu_gender'],
                          birth: widget.userInfo['gu_birth_date'],
                          email: widget.userInfo['gu_email'],
                          phone: widget.userInfo['gu_phone_number'],
                          step: widget.userInfo['gu_step_number'] + addStep,
                          point: widget.userInfo['gu_point_number'],
                          profileImage: widget.userInfo['gu_profile_image']);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommonFrame1(
                                    idKey: widget.idKey,
                                    themeColor: widget.themeColor,
                                    title: "GROAD",
                                    clas: Home(
                                      idKey: widget.idKey,
                                      mapType: widget.mapType,
                                      themeColor: widget.themeColor,
                                    ),
                                  )),
                          (route) => false);
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다.');
                    } else if (mk4_col_red == true) {
                        if (courseKey == 1) {
                          addStep = 27.5;
                        } else if (courseKey == 2) {
                          addStep = 4.6;
                        } else if (courseKey == 3) {
                          addStep = 2.5;
                        } else if (courseKey == 4) {
                          addStep = 27.3;
                        } else if (courseKey == 5) {
                          addStep = 15.4;
                        } else if (courseKey == 6) {
                          addStep = 15.5;
                        } else if (courseKey == 7) {
                          addStep = 3.7;
                        } else if (courseKey == 8) {
                          addStep = 2.8;
                        } else if (courseKey == 9) {
                          addStep = 2.4;
                        }
                        await UserAPI(context: context).updateUser(
                            pk: widget.idKey,
                            id: widget.userInfo['gu_id'],
                            pw: widget.userInfo['gu_pw'],
                            name: widget.userInfo['gu_name'],
                            gender: widget.userInfo['gu_gender'],
                            birth: widget.userInfo['gu_birth_date'],
                            email: widget.userInfo['gu_email'],
                            phone: widget.userInfo['gu_phone_number'],
                            step: widget.userInfo['gu_step_number'] + addStep,
                            point: widget.userInfo['gu_point_number'],
                            profileImage: widget.userInfo['gu_profile_image']
                        );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommonFrame1(
                                    idKey: widget.idKey,
                                    themeColor: widget.themeColor,
                                    title: "GROAD",
                                    clas: Home(
                                      idKey: widget.idKey,
                                      mapType: widget.mapType,
                                      themeColor: widget.themeColor,
                                    ),
                                  )),
                          (route) => false);
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다.');
                    } else if (mk5_col_red == true) {
                        if (courseKey == 1) {
                          addStep = 31.7;
                        } else if (courseKey == 2) {
                          addStep = 7.2;
                        } else if (courseKey == 3) {
                          addStep = 11.4;
                        } else if (courseKey == 4) {
                          addStep = 41.1;
                        } else if (courseKey == 5) {
                          addStep = 21.8;
                        } else if (courseKey == 6) {
                          addStep = 15.9;
                        } else if (courseKey == 7) {
                          addStep = 6.0;
                        } else if (courseKey == 8) {
                          addStep = 4.2;
                        } else if (courseKey == 9) {
                          addStep = 4.6;
                        }
                        await UserAPI(context: context).updateUser(
                            pk: widget.idKey,
                            id: widget.userInfo['gu_id'],
                            pw: widget.userInfo['gu_pw'],
                            name: widget.userInfo['gu_name'],
                            gender: widget.userInfo['gu_gender'],
                            birth: widget.userInfo['gu_birth_date'],
                            email: widget.userInfo['gu_email'],
                            phone: widget.userInfo['gu_phone_number'],
                            step: widget.userInfo['gu_step_number'] + addStep,
                            point: widget.userInfo['gu_point_number'],
                            profileImage: widget.userInfo['gu_profile_image']
                        );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommonFrame1(
                                    idKey: widget.idKey,
                                    themeColor: widget.themeColor,
                                    title: "GROAD",
                                    clas: Home(
                                      idKey: widget.idKey,
                                      mapType: widget.mapType,
                                      themeColor: widget.themeColor,
                                    ),
                                  )),
                          (route) => false);
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다.');
                    } else {
                      print("다시 테스트 해본다...");
                        if (courseKey == 1) {
                          addStep = 32.1;
                        } else if (courseKey == 2) {
                          addStep = 16.9;
                        } else if (courseKey == 3) {
                          addStep = 14.2;
                        } else if (courseKey == 4) {
                          addStep = 41.6;
                        } else if (courseKey == 5) {
                          addStep = 24.0;
                        } else if (courseKey == 6) {
                          addStep = 40.4;
                        } else if (courseKey == 7) {
                          addStep = 8.2;
                        } else if (courseKey == 8) {
                          addStep = 4.3;
                        } else if (courseKey == 9) {
                          addStep = 4.9;
                        }

                        try{
                          await UserAPI(context: context).updateUser(
                              pk: widget.idKey,
                              id: widget.userInfo['gu_id'],
                              pw: widget.userInfo['gu_pw'],
                              name: widget.userInfo['gu_name'],
                              gender: widget.userInfo['gu_gender'],
                              birth: widget.userInfo['gu_birth_date'],
                              email: widget.userInfo['gu_email'],
                              phone: widget.userInfo['gu_phone_number'],
                              step: widget.userInfo['gu_step_number'] + addStep,
                              point: widget.userInfo['gu_point_number'] + addPoint,
                              profileImage: widget.userInfo['gu_profile_image']
                          );
                        }catch(e){
                          print(e);
                        }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CommonFrame1(
                                    idKey: widget.idKey,
                                    themeColor: widget.themeColor,
                                    title: "GROAD",
                                    clas: Home(
                                      idKey: widget.idKey,
                                      mapType: widget.mapType,
                                      themeColor: widget.themeColor,
                                    ),
                                  )),
                          (route) => false);
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 40,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '코스 주행을 종료합니다. \n(포인트 $addPoint 적립)');
                    }
                  } else if (course_flag == true) {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '코스 주행을 시작합니다.');
                  }
                }
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
                                : widget.themeColor == 0
                                    ? Color(ThemeColors.deepNavy)
                                    : widget.themeColor == 1
                                        ? ThemeColors.deepGreen
                                        : ThemeColors.deepOrange,
                            width: 3)),
                    child: Icon(
                      Icons.directions_walk,
                      color: course_flag
                          ? ThemeColors.red
                          : widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    course_flag ? '코스 주행 종료' : '코스 주행 시작',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                ? widget.themeColor == 0
                                    ? Color(ThemeColors.deepNavy)
                                    : widget.themeColor == 1
                                        ? ThemeColors.deepGreen
                                        : ThemeColors.deepOrange
                                : ThemeColors.gray1,
                            width: 3)),
                    child: Icon(
                      Icons.qr_code,
                      color: course_flag
                          ? widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : ThemeColors.deepOrange
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
                            ? widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange
                            : ThemeColors.gray1),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print(widget.idKey);
                print(widget.userInfo);
                NotifyDialog.show(context,
                    style: TextStyle(
                        fontSize: 50,
                        color: ThemeColors.black,
                        height: 23 / 18),
                    message: '유의 사항을 지켜주세요.\n\n'
                        '1. 코스 주행을 시작하게 되면 시작지점에서\n부터 시작하여 순서대로 코스를 주행해주세\n요.\n\n'
                        '2. 해당 거점에 도착시 QR 스탬프 버튼을\n 누른 뒤 거점에 설치된 QR코드를 찍으면\n 방문 인증이 됩니다. 인증이 완료되면 지\n도에 표시된 거점 텍스트가 초록색으로 변\n합니다.\n'
                        '(단, 코스 경로 순서대로 찍으셔야 하며 \n중간에 건너뛴 거점이 있다면 QR코드를 인\n식하지 않습니다.)\n\n'
                        '3. 마지막 거점까지 모두 스탬프를 찍고 난\n뒤 코스 주행 종료버튼을 누르면 코스 주\n행이 완료되며 적립 포인트가 지급 됩니다.\n'
                        '(단, 코스를 완료하지 않은 상태에서 중간에 \n종료를 하게 되면 포인트는 받으실 수\n 없으며 해당지점까지의 걸음정보만 추가\n기록 됩니다.)');
              },
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            width: 3)),
                    child: Icon(
                      Icons.question_mark,
                      color: widget.themeColor == 0
                          ? Color(ThemeColors.deepNavy)
                          : widget.themeColor == 1
                              ? ThemeColors.deepGreen
                              : ThemeColors.deepOrange,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    '도움말',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _positionTap1() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommonFrame2(
                themeColor: widget.themeColor,
                title: '여행 코스 둘러보기',
                clas: Position(
                  themeColor: widget.themeColor,
                  courseKey: courseKey,
                  positionKey: positionKey,
                  name: startPoint,
                ),
              )),
    );
  }

  void _positionTap2() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommonFrame2(
                themeColor: widget.themeColor,
                title: '여행 코스 둘러보기',
                clas: Position(
                  themeColor: widget.themeColor,
                  courseKey: courseKey,
                  positionKey: positionKey,
                  name: wayPoint1,
                ),
              )),
    );
  }

  void _positionTap3() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommonFrame2(
                themeColor: widget.themeColor,
                title: '여행 코스 둘러보기',
                clas: Position(
                  themeColor: widget.themeColor,
                  courseKey: courseKey,
                  positionKey: positionKey,
                  name: wayPoint2,
                ),
              )),
    );
  }

  void _positionTap4() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommonFrame2(
                themeColor: widget.themeColor,
                title: '여행 코스 둘러보기',
                clas: Position(
                  themeColor: widget.themeColor,
                  courseKey: courseKey,
                  positionKey: positionKey,
                  name: wayPoint3,
                ),
              )),
    );
  }

  void _positionTap5() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CommonFrame2(
                themeColor: widget.themeColor,
                title: '여행 코스 둘러보기',
                clas: Position(
                  themeColor: widget.themeColor,
                  courseKey: courseKey,
                  positionKey: positionKey,
                  name: endPoint,
                ),
              )),
    );
  }

  Future _scan({
    String mk1,
    String mk2,
    String mk3,
    String mk4,
    String mk5,
  }) async {
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

  Future<List<LatLng>> _fetchLatLng() async {
    response = await UserAPI(context: context).getPath_(
        Lat1: Lat1.toString(),
        Lat2: Lat2.toString(),
        Lat3: Lat3.toString(),
        Lat4: Lat4.toString(),
        Lat5: Lat5.toString(),
        Lng1: Lng1.toString(),
        Lng2: Lng2.toString(),
        Lng3: Lng3.toString(),
        Lng4: Lng4.toString(),
        Lng5: Lng5.toString());
    final keyWord = courseKey.toString();
    final pathOverlayId = PathOverlayId("course$keyWord");
    _pathOverlays = new Set<PathOverlay>();

    path = response["route"]["trafast"][0]["path"];

    if (flag == 0) {
      for (int i = 0; i < path.length; i++) {
        path_prepared.add(LatLng(path[i][1], path[i][0]));
      }
      flag++;
    }

    _pathOverlays.add(PathOverlay(
      pathOverlayId,
      path_prepared,
      width: 3,
      outlineWidth: 2,
      color: widget.themeColor == 0
          ? Color(ThemeColors.deepNavy)
          : widget.themeColor == 1
              ? ThemeColors.deepGreen
              : ThemeColors.deepOrange,
      outlineColor: widget.themeColor == 0
          ? Color(ThemeColors.deepNavy)
          : widget.themeColor == 1
              ? ThemeColors.deepGreen
              : ThemeColors.deepOrange,
    ));
    await Future.delayed(Duration(seconds: 1));
    return path_prepared;
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
