import 'package:flutter/material.dart';

import '../../../../constant/theme.dart';
import '../../../frame/common_frame2.dart';
import '../TravelCourse.dart';

class TravelCourseBody extends StatefulWidget {
  TravelCourseBody(
      {Key key,
      this.idKey,
      this.mapType,
      this.userInfo,
      this.themeColor,
      this.courseInfo})
      : super(key: key);

  int idKey;
  int themeColor;
  int mapType;
  dynamic userInfo;
  dynamic courseInfo;

  @override
  _TravelCourseBodyState createState() => _TravelCourseBodyState();
}

class _TravelCourseBodyState extends State<TravelCourseBody> {
  dynamic courseInfo;
  String startPoint;
  String endPoint;
  String time;
  String title;
  String distance;
  int courseKey;
  String image;

  @override
  void initState() {
    courseInfo = widget.courseInfo;
    courseKey = courseInfo['gt_course_key'];
    startPoint = courseInfo["gt_course_name1"];
    endPoint = courseInfo["gt_course_name5"];
    time = courseInfo["gt_time"].toString();
    title = courseInfo["gt_course_title"];
    distance = courseInfo["gt_distance"].toString();
    image = courseInfo['gt_title_image'];

    if (widget.mapType == null) {
      widget.mapType = 0;
    }
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CommonFrame2(
                  themeColor: widget.themeColor,
                  title: '여행 코스 둘러보기',
                  clas: TravelCourse(
                    courseInfo: widget.courseInfo,
                    userInfo: widget.userInfo,
                    idKey: widget.idKey,
                    mapType: widget.mapType,
                    themeColor: widget.themeColor,
                  ))),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              'assets/$image',
              width: width * 0.85158,
              height: height * 0.32581,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.23182),
            child: Container(
              decoration: BoxDecoration(
                  color: widget.themeColor == 0
                      ? Color(ThemeColors.deepNavy)
                      : widget.themeColor == 1
                          ? ThemeColors.deepGreen
                          : ThemeColors.deepOrange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01879,
                horizontal: width * 0.03352,
              ),
              width: width * 0.85158,
              //color: Colors.lightBlue[800],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            ' 출발 $startPoint',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '약 $time분',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.006565,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            ' 도착 $endPoint',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '총 $distance km',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/backShade.png',
            width: width * 0.85158,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: width * 0.048661, top: height * 0.027568),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '제 $courseKey 코스',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.00626,
                ),
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 25.0,
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
}
