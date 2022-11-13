import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constant/theme.dart';

class TravelInfoBody extends StatefulWidget {
  TravelInfoBody({Key key, this.courseInfo, this.themeColor}) : super(key: key);

  dynamic courseInfo;
  int themeColor;

  @override
  _TravelInfoBodyState createState() => _TravelInfoBodyState();
}

class _TravelInfoBodyState extends State<TravelInfoBody> {
  String title;
  String distance;
  String time;
  String name1;
  String name2;
  String name3;
  String name4;
  String name5;
  String image;

  @override
  void initState() {
    print(widget.courseInfo);
    title = widget.courseInfo['gt_course_title'];
    distance= widget.courseInfo['gt_distance'].toString();
    time = widget.courseInfo['gt_time'].toString();
    name1 = widget.courseInfo['gt_course_name1'];
    name2 = widget.courseInfo['gt_course_name2'];
    name3 = widget.courseInfo['gt_course_name3'];
    name4 = widget.courseInfo['gt_course_name4'];
    name5 = widget.courseInfo['gt_course_name5'];
    image = widget.courseInfo['gt_title_image'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: 25, left: 15, right:15),
      color: Colors.white,
      child: Column(
        children: [
          Image.asset('assets/$image'), //코스 이미지1
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "$distance km",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    "$time 분",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ), //춘천 사색의 길
          SizedBox(
            height: 20.0,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Center(
                  child: Container(
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.lightSky)
                        : widget.themeColor == 1
                        ? ThemeColors.lightGreen
                        : ThemeColors.lightOrange,
                    width: width * 0.85,
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
                    width: 40.0,
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
                    width: 45.0,
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
                    width: 35.0,
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
                    width: 50.0,
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
          ), //코스 선(그림)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                child: Center(
                  child: Text(
                    name1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                child: Center(
                  child: Text(
                    name2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                child: Center(
                  child: Text(
                    name3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                child: Center(
                  child: Text(
                    name4,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 66,
                height: 63,
                child: Center(
                  child: Text(
                    name5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ),
            ],
          ),  //춘천역 옛산길 고개마루에서 직진
          SizedBox(height: 10.0,),
          Container(
            width: 361,
            height: 1.0,
            color: Colors.grey,
          ),  //회색 구분 선
        ],
      ),
    );
  }
}
