import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../../../../constant/theme.dart';
import '../../TravelCourse/PositionPage/full_screen_page.dart';

class CafePosition extends StatefulWidget {
  CafePosition(
      {Key key,
      this.cafeName,
      this.cafeImage,
      this.cafeLat,
      this.cafeLng,
      this.mapType,
      this.themeColor,
      this.cafeInfo})
      : super(key: key);

  String cafeName;
  String cafeImage;
  double cafeLat;
  double cafeLng;
  int mapType;
  int themeColor;
  String cafeInfo;

  @override
  _CafePositionState createState() => _CafePositionState();
}

class _CafePositionState extends State<CafePosition> {
  Completer<NaverMapController> _controller = Completer();

  @override
  void initState() {
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    if (widget.mapType == null) {
      widget.mapType = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    CameraPosition _cameraPosition = CameraPosition(
        target: LatLng(widget.cafeLat, widget.cafeLng), zoom: 15);

    MapType _mapType = widget.mapType == 0
        ? MapType.Basic
        : widget.mapType == 1
            ? MapType.Satellite
            : MapType.Hybrid;

    Marker marker = Marker(
      markerId: "231",
      position: LatLng(widget.cafeLat, widget.cafeLng),
      captionText: widget.cafeName,
      captionColor: widget.themeColor == 0
          ? Color(ThemeColors.deepNavy)
          : widget.themeColor == 1
              ? ThemeColors.deepGreen
              : ThemeColors.deepOrange,
      captionTextSize: 15,
      width: 20,
      height: 30,
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cafeName,
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
                  height: 7.0,
                ),
                Container(
                  color: widget.themeColor == 0
                      ? Color(ThemeColors.deepNavy)
                      : widget.themeColor == 1
                          ? ThemeColors.deepGreen
                          : ThemeColors.deepOrange,
                  width: 128.0,
                  height: 3.0,
                ),
              ],
            ), //옛산길
            SizedBox(
              height: 23.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        barrierColor: Colors.black,
                        pageBuilder: (BuildContext context, _, __) {
                          return FullScreenPage(
                            image: Image.network(
                              widget.cafeImage,
                              width: screenSize.width * 0.9,
                              height: 230,
                              fit: BoxFit.contain,
                            ),
                          );
                        }));
              },
              child: Image.network(
                widget.cafeImage,
                width: screenSize.width * 0.9,
                height: 230,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: screenSize.width * 0.9,
              height: 230,
              child: NaverMap(
                locationButtonEnable: true,
                onMapCreated: onMapCreated,
                mapType: _mapType,
                initialCameraPosition: _cameraPosition,
                markers: [marker],
              ),
            )
          ]),
        ),
        SizedBox(
          height: 15.0,
        ),
        widget.cafeInfo != null ||
                widget.cafeInfo == '' ||
                widget.cafeInfo == 'None'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      '카페 정보',
                      style: TextStyle(
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : ThemeColors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 1,
              ), //정의 및 역사
        SizedBox(
          height: 5.0,
        ),
        widget.cafeInfo != null ||
                widget.cafeInfo == '' ||
                widget.cafeInfo == 'None'
            ? Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300], width: 2)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.11,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.cafeInfo,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : Color(0xFFB8860B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 1,
              ), //텍스트 상자
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
