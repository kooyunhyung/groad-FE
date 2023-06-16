import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/lodging_list/components/lodging_position.dart';

import '../../../constant/theme.dart';
import '../../frame/common_frame2.dart';

class LodgingList extends StatefulWidget {
  LodgingList({Key key,this.mapType, this.themeColor, this.lodgingInfo}) : super(key: key);

  int mapType;
  int themeColor;
  dynamic lodgingInfo;

  @override
  _LodgingListState createState() => _LodgingListState();
}

class _LodgingListState extends State<LodgingList> {
  String courseInfo;

  @override
  void initState() {
    if(widget.mapType==null){
      widget.mapType=0;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    courseInfo = widget.lodgingInfo['gll_course'];
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
                  title: '숙소 정보',
                  clas: LodgingPosition(
                    lodgingName: widget.lodgingInfo['gll_name'],
                    lodgingImage: widget.lodgingInfo['gll_main_image'],
                    lodgingLat: widget.lodgingInfo['gll_lat'],
                    lodgingLng: widget.lodgingInfo['gll_lng'],
                    lodgingInfo: widget.lodgingInfo['gll_info'],
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
                    widget.lodgingInfo['gll_main_image'],
                  ),
                ),
                title: Text(
                  widget.lodgingInfo['gll_name'],
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
