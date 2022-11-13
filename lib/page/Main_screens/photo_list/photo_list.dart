import 'package:flutter/material.dart';

import '../../../constant/theme.dart';
import '../../frame/common_frame2.dart';
import 'components/photo_position.dart';

class PhotoList extends StatefulWidget {
  PhotoList({Key key, this.mapType, this.themeColor, this.photoInfo}) : super(key: key);

  int mapType;
  int themeColor;
  dynamic photoInfo;

  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  String courseInfo;

  @override
  void initState() {
    if(widget.mapType==null){
      widget.mapType=0;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    courseInfo = widget.photoInfo['gpl_course'];
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
                  title: '포토스팟 정보',
                  clas: PhotoPosition(
                    photoName: widget.photoInfo['gpl_name'],
                    photoImage: widget.photoInfo['gpl_main_image'],
                    photoLat: widget.photoInfo['gpl_lat'],
                    photoLng: widget.photoInfo['gpl_lng'],
                    photoInfo: widget.photoInfo['gpl_info'],
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
                    widget.photoInfo['gpl_main_image'],
                  ),
                ),
                title: Text(
                  widget.photoInfo['gpl_name'],
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
