import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/cafe_list/components/cafe_position.dart';

import '../../../constant/theme.dart';
import '../../frame/common_frame2.dart';

class CafeList extends StatefulWidget {
  CafeList({Key key, this.mapType, this.themeColor, this.cafeInfo}) : super(key: key);

  int mapType;
  int themeColor;
  dynamic cafeInfo;

  @override
  _CafeListState createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  String courseInfo;

  @override
  void initState() {
    if(widget.mapType==null){
      widget.mapType=0;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    courseInfo = widget.cafeInfo['gcl_course'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CommonFrame2(
                  themeColor: widget.themeColor,
                  title: '카페 정보',
                  clas: CafePosition(
                    cafeName: widget.cafeInfo['gcl_name'],
                    cafeImage: widget.cafeInfo['gcl_main_image'],
                    cafeLat: widget.cafeInfo['gcl_lat'],
                    cafeLng: widget.cafeInfo['gcl_lng'],
                    cafeInfo: widget.cafeInfo['gcl_info'],
                    mapType: widget.mapType,
                    themeColor: widget.themeColor,
                  ))),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Container(
              width: width * 0.96,
              height: height * 0.09,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ThemeColors.gray1, width: 2)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: widget.themeColor == 0
                      ? Color(ThemeColors.deepNavy)
                      : widget.themeColor == 1
                          ? ThemeColors.deepGreen
                          : ThemeColors.deepOrange,
                  radius: 30,
                  backgroundImage: NetworkImage(
                    widget.cafeInfo['gcl_main_image'],
                  ),
                ),
                title: Text(
                  widget.cafeInfo['gcl_name'],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.deepNavy)
                        : widget.themeColor == 1
                            ? ThemeColors.deepGreen
                            : ThemeColors.deepOrange,
                  ),
                ),
                subtitle: Text('주변코스 : $courseInfo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
