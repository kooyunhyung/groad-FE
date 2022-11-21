import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Main_screens/TravelCourse/PositionPage/full_screen_page.dart';

class Position extends StatefulWidget {
  Position({Key key, this.themeColor, this.courseKey, this.positionKey, this.name})
      : super(key: key);

  int themeColor;
  final int courseKey;
  final int positionKey;
  final String name;

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
  dynamic response;
  dynamic result;
  int trafficKey1;
  int trafficKey2;

  @override
  void initState() {
    if(widget.themeColor==null){
      widget.themeColor=0;
    }

    super.initState();
    trafficKey1 = (widget.positionKey + 1);
    trafficKey2 = (widget.positionKey + 2);
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return FutureBuilder(
        future: _fetchInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Center(
              child: Container(
                  width: 50, height: 50, child: CircularProgressIndicator()),
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
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
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
                                      pageBuilder:
                                          (BuildContext context, _, __) {
                                        return FullScreenPage(
                                          image: Image.network(
                                            snapshot.data['gc_main_image'],
                                            width: screenSize.width*0.9,
                                            height: 230,
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      }));
                            },
                            child: Image.network(
                              snapshot.data['gc_main_image'],
                              width: screenSize.width*0.9,
                              height: 230,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          opaque: false,
                                          barrierColor: Colors.black,
                                          pageBuilder:
                                              (BuildContext context, _, __) {
                                            return FullScreenPage(
                                              image: Image.network(
                                                snapshot.data['gc_sub_image1'],
                                                width: 115,
                                                height: 71,
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          }));
                                },
                                child: Image.network(
                                  snapshot.data['gc_sub_image1'],
                                  width: 115,
                                  height: 71,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          opaque: false,
                                          barrierColor: Colors.black,
                                          pageBuilder:
                                              (BuildContext context, _, __) {
                                            return FullScreenPage(
                                              image: Image.network(
                                                snapshot.data['gc_sub_image2'],
                                                width: 115,
                                                height: 71,
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          }));
                                },
                                child: Image.network(
                                  snapshot.data['gc_sub_image2'],
                                  width: 115,
                                  height: 71,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          opaque: false,
                                          barrierColor: Colors.black,
                                          pageBuilder:
                                              (BuildContext context, _, __) {
                                            return FullScreenPage(
                                              image: Image.network(
                                                snapshot.data['gc_sub_image3'],
                                                width: 115,
                                                height: 71,
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          }));
                                },
                                child: Image.network(
                                  snapshot.data['gc_sub_image3'],
                                  width: 115,
                                  height: 71,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ), //서브 이미지
                        ]),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  snapshot.data['gc_text']!=null? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          '소개',
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
                  ):SizedBox(height: 1,), //정의 및 역사
                  SizedBox(
                    height: 5.0,
                  ),
                  snapshot.data['gc_text']!=null? Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:Colors.grey[300],width: 2)
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 5),
                      width: screenSize.width * 0.9,
                      height: 40 *
                          (snapshot.data['gc_text'].toString().length / 27),
                      child: Text(
                        snapshot.data['gc_text'].toString(),
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
                  ):SizedBox(height: 1,), //텍스트 상자
                  SizedBox(
                    height: 15.0,
                  ),
                  trafficKey1 != 5
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 24.0),
                              child: Text(
                                '교통 정보 (현재 => 다음)',
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
                        ),
                  SizedBox(
                    height: 5.0,
                  ),
                  trafficKey1 != 5
                      ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Colors.grey[300],width: 2)
                    ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 5),
                          width: screenSize.width * 0.9,
                          height: 40 *
                              (result['gc_traffic$trafficKey1$trafficKey2']
                                      .toString()
                                      .length /
                                  20),
                          child: Text(
                            snapshot.data['gc_traffic$trafficKey1$trafficKey2']
                                .toString(),
                            style: TextStyle(
                              color: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                  ? ThemeColors.deepGreen
                                  : Color(0xFFB8860B),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 1,
                        ),
                  SizedBox(
                    height: 70.0,
                  ),
                ],
              ),
            );
          }
        });
  }

  Future<dynamic> _fetchInfo() async {
    if (widget.courseKey == 1) {
      response = await UserAPI(context: context).getCourse1Position();
    } else if (widget.courseKey == 2) {
      response = await UserAPI(context: context).getCourse2Position();
    } else if (widget.courseKey == 3) {
      response = await UserAPI(context: context).getCourse3Position();
    } else if (widget.courseKey == 4) {
      response = await UserAPI(context: context).getCourse4Position();
    } else if (widget.courseKey == 5) {
      response = await UserAPI(context: context).getCourse5Position();
    } else if (widget.courseKey == 6) {
      response = await UserAPI(context: context).getCourse6Position();
    } else if (widget.courseKey == 7) {
      response = await UserAPI(context: context).getCourse7Position();
    } else if (widget.courseKey == 8) {
      response = await UserAPI(context: context).getCourse8Position();
    } else if (widget.courseKey == 9) {
      response = await UserAPI(context: context).getCourse9Position();
    }
    result = response[widget.positionKey];
    return result;
  }
}
