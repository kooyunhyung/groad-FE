import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/page/Menu_screens/Login_Info/LoginPage.dart';
import 'package:gload_app/page/Menu_screens/inquiry/inquiry.dart';
import 'package:gload_app/page/Menu_screens/question/question.dart';
import 'package:gload_app/page/Menu_screens/setting/setting.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/user_api.dart';
import '../../component/dialog/notify_dialog.dart';
import '../../constant/theme.dart';
import '../Main_screens/benefits.dart';
import '../Main_screens/feed.dart';
import '../Main_screens/home.dart';
import '../Main_screens/mypage.dart';
import '../Main_screens/schedule.dart';
import '../Menu_screens/TravleInfo/TravelInfo.dart';
 import '../Menu_screens/travelAssistant/travel_assistant.dart';
import 'common_frame2.dart';

class CommonFrame1 extends StatefulWidget {
  CommonFrame1({Key key, this.idKey, this.mapType, this.userInfo, this.title, this.clas, this.themeColor})
      : super(key: key);

  int idKey;
  dynamic userInfo;
  int mapType;
  final Object clas;
  final String title;
  int themeColor;

  @override
  _CommonFrame1State createState() => _CommonFrame1State();
}

class _CommonFrame1State extends State<CommonFrame1> {
  dynamic settingResponse;
  dynamic userResponse;
  String name;
  int point;
  String profileImageUrl;
  final imgBBkey = '0546c22e94c94bf76ece9bca3e0542f2';
  Dio dio = new Dio();
  dynamic imageUriResponse;

  final ImagePicker _picker = ImagePicker();
  XFile _image;

  @override
  void initState() {
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.idKey != -1) {
      Future.delayed(Duration.zero, () async {
        dynamic response1 =
            await UserAPI(context: context).getSetting(fk: widget.idKey);
        settingResponse = response1;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 2;
    var pages = [
      Schedule(), //하단 0번 인덱스
      Benefits(), //하단 1번 인덱스
      widget.clas, //하단 2번 인덱스(default)
      Feed(), //하단 3번 인덱스
      MyPage(), //하단 4번 인덱스
    ];

    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.only(top: 15, left: 15),
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.idKey == -1
                            ? Row(
                                children: [
                                  Text(
                                    '로그인 해주세요',
                                    style: textTheme().headline4,
                                  ),
                                  SizedBox(
                                    width: 33,
                                  ),
                                  Icon(
                                    Icons.account_circle_sharp,
                                    color: Colors.grey,
                                    size: 50.0,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  FutureBuilder(
                                      future: _fetchUserInfo1(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        final result = snapshot.data;
                                        if (snapshot.hasData == false) {
                                          return Center(
                                            child: Container(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator()),
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
                                          return Text(
                                            '$result 님 \n환영합니다!',
                                            style: textTheme().headline4,
                                          );
                                        }
                                      }),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  FutureBuilder(
                                      future: _fetchUserInfo3(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData == false) {
                                          return Row(
                                            children: [
                                              Icon(
                                                Icons.account_circle_sharp,
                                                color: Colors.grey,
                                                size: 50.0,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    _getImage();
                                                  },
                                                  child: Icon(Icons
                                                      .add_a_photo_rounded))
                                            ],
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
                                          return snapshot.data == "None" ||
                                                  snapshot.data == ''
                                              ? Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .account_circle_sharp,
                                                      color: Colors.grey,
                                                      size: 50.0,
                                                    ),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          _getImage();
                                                        },
                                                        child: Icon(Icons
                                                            .add_a_photo_rounded))
                                                  ],
                                                )
                                              : Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor: widget
                                                                  .themeColor ==
                                                              0
                                                          ? Color(
                                                              ThemeColors.deepNavy)
                                                          : widget.themeColor == 1
                                                              ? ThemeColors
                                                                  .deepGreen
                                                              : ThemeColors
                                                                  .deepOrange,
                                                      radius: 40,
                                                      backgroundImage: NetworkImage(
                                                        snapshot.data,
                                                      ),
                                                    ),
                                                  SizedBox(width: 5,),
                                                  GestureDetector(onTap: (){
                                                    _getImage();
                                                  },child: Icon(Icons.refresh_rounded))
                                                ],
                                              );
                                        }
                                      })
                                ],
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        widget.idKey == -1
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CommonFrame2(
                                              title: '로그인',
                                              clas: LoginPage(),
                                            )),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      '로그인',
                                      style: textTheme().subtitle1,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Colors.black,
                                      size: 16,
                                    )
                                  ],
                                ),
                              )
                            : Row(
                                children: [
                                  Text('나의 포인트: '),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  FutureBuilder(
                                      future: _fetchUserInfo2(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData == false) {
                                          return Center(
                                            child: Container(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator()),
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
                                          return Text(
                                            '$point  P',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: widget.themeColor == 0
                                                    ? Color(
                                                        ThemeColors.deepNavy)
                                                    : widget.themeColor == 1
                                                        ? ThemeColors.deepGreen
                                                        : ThemeColors
                                                            .deepOrange),
                                          );
                                        }
                                      })
                                ],
                              ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ), //로그인 정보
              ListTile(
                title: Text(
                  '여행 정보',
                  style: widget.themeColor == 0
                      ? textTheme().headline1
                      : widget.themeColor == 1
                          ? textTheme().headline2
                          : widget.themeColor == 2
                              ? textTheme().headline3
                              : textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                            themeColor: widget.themeColor,
                            title: '여행 정보',
                            clas: TravelInfo(themeColor: widget.themeColor))),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '여행 도우미',
                  style: widget.themeColor == 0
                      ? textTheme().headline1
                      : widget.themeColor == 1
                          ? textTheme().headline2
                          : widget.themeColor == 2
                              ? textTheme().headline3
                              : textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                              themeColor: widget.themeColor,
                              title: '여행 도우미',
                              clas: TravelAssistant(themeColor: widget.themeColor),
                            )),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '자주 묻는 질문',
                  style: widget.themeColor == 0
                      ? textTheme().headline1
                      : widget.themeColor == 1
                          ? textTheme().headline2
                          : widget.themeColor == 2
                              ? textTheme().headline3
                              : textTheme().headline1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommonFrame2(
                              themeColor: widget.themeColor,
                              title: '자주 묻는 질문',
                              clas: Question(themeColor: widget.themeColor),
                            )),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              widget.idKey != -1
                  ? ListTile(
                      leading: Text(
                        '이벤트',
                        style: widget.themeColor == 0
                            ? textTheme().headline1
                            : widget.themeColor == 1
                                ? textTheme().headline2
                                : widget.themeColor == 2
                                    ? textTheme().headline3
                                    : textTheme().headline1,
                      ),
                      onTap: () {},
                    )
                  : Container(),
              widget.idKey != -1
                  ? Container(
                      height: 1,
                      color: Colors.grey[200],
                    )
                  : Container(),
              widget.idKey != -1
                  ? ListTile(
                      leading: Text(
                        '문의하기',
                        style: widget.themeColor == 0
                            ? textTheme().headline1
                            : widget.themeColor == 1
                                ? textTheme().headline2
                                : widget.themeColor == 2
                                    ? textTheme().headline3
                                    : textTheme().headline1,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommonFrame2(
                                    themeColor: widget.themeColor,
                                    title: '문의하기',
                                    clas:
                                        Inquiry(themeColor: widget.themeColor),
                                  )),
                        );
                      },
                    )
                  : Container(),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListTile(
                leading: Text(
                  '이용 약관',
                  style: widget.themeColor == 0
                      ? textTheme().headline1
                      : widget.themeColor == 1
                          ? textTheme().headline2
                          : widget.themeColor == 2
                              ? textTheme().headline3
                              : textTheme().headline1,
                ),
                onTap: () {},
              ),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              widget.idKey != -1
                  ? ListTile(
                      leading: Text(
                        '설정',
                        style: widget.themeColor == 0
                            ? textTheme().headline1
                            : widget.themeColor == 1
                                ? textTheme().headline2
                                : widget.themeColor == 2
                                    ? textTheme().headline3
                                    : textTheme().headline1,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommonFrame2(
                                    themeColor: widget.themeColor,
                                    title: '설정',
                                    clas: Setting(
                                      idKey: widget.idKey,
                                      themeColor: widget.themeColor,
                                      settingInfo: settingResponse,
                                    ),
                                  )),
                        );
                      },
                    )
                  : Container(),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              widget.idKey != -1
                  ? ListTile(
                      leading: Text(
                        '로그아웃',
                        style: widget.themeColor == 0
                            ? textTheme().headline1
                            : widget.themeColor == 1
                                ? textTheme().headline2
                                : widget.themeColor == 2
                                    ? textTheme().headline3
                                    : textTheme().headline1,
                      ),
                      onTap: () async {
                        await Future.delayed(Duration(milliseconds: 300));
                        setState(() {
                          widget.idKey = -1;
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => CommonFrame1(
                                      idKey: widget.idKey,
                                      themeColor: 0,
                                      title: "GROAD",
                                      clas: Home(idKey: widget.idKey),
                                    )),
                            (route) => false);
                        NotifyDialog.show(context,
                            style: TextStyle(
                                fontSize: 50,
                                color: ThemeColors.black,
                                height: 23 / 18),
                            message: '로그아웃 되었습니다.');
                      },
                    )
                  : Container(),
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
            ],
          ),
        ),
      ),
      //측면 메류 서랍
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: widget.themeColor == 0
              ? Color(0xffA2E2F8)
              : widget.themeColor == 1
                  ? Color(0xFF90EE90)
                  : Color(0xFFFFD700),
          iconTheme: IconThemeData(
              color: widget.themeColor == 0
                  ? Color(ThemeColors.deepNavy)
                  : widget.themeColor == 1
                      ? ThemeColors.deepGreen
                      : ThemeColors.deepOrange),
          title: Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.themeColor == 0
                    ? Color(ThemeColors.deepNavy)
                    : widget.themeColor == 1
                        ? ThemeColors.deepGreen
                        : ThemeColors.deepOrange),
          ),
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          //   IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          // ],
        ),
      ),
      //앱 바
      body: pages[selectedIndex],
    );
  }

  Future<dynamic> _fetchUserInfo1() async {
    if (widget.idKey != -1) {
      dynamic response2 =
          await UserAPI(context: context).getUser(pk: widget.idKey);
      userResponse = response2;
      name = userResponse['gu_name'];
    }
    return name;
  }

  Future<dynamic> _fetchUserInfo2() async {
    if (widget.idKey != -1) {
      dynamic response2 =
          await UserAPI(context: context).getUser(pk: widget.idKey);
      userResponse = response2;
      point = userResponse['gu_point_number'];
    }
    return point;
  }

  Future<dynamic> _fetchUserInfo3() async {
    if (widget.idKey != -1) {
      dynamic response2 =
          await UserAPI(context: context).getUser(pk: widget.idKey);
      userResponse = response2;
      profileImageUrl = userResponse['gu_profile_image'];
    }
    return profileImageUrl;
  }

  Future _getImage() async {
    XFile image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() async {
      if(image!=null){
        NotifyDialog.show(context,
            style: TextStyle(
                fontSize: 50,
                color: ThemeColors.black,
                height: 23 / 18),
            message: '잠시만 기다려주세요.');
      }
      _image = image;
      File _media = File(_image.path);

      ByteData bytes = _media.readAsBytesSync().buffer.asByteData();
      var buffer = bytes.buffer;
      var m = base64.encode(Uint8List.view(buffer));

      FormData formData = FormData.fromMap({"key": imgBBkey, "image": m});
      Response response = await dio.post(
        "https://api.imgbb.com/1/upload",
        data: formData,
      );
      imageUriResponse = response.data;

      final userUpdateResponse = await UserAPI(context: context).updateUser(
        pk: widget.idKey,
        id: userResponse['gu_id'],
        pw: userResponse['gu_pw'],
        name: userResponse['gu_name'],
        gender: userResponse['gu_gender'],
        birth: userResponse['gu_birth_date'],
        email: userResponse['gu_email'],
        phone: userResponse['gu_phone_number'],
        point: userResponse['gu_point_number'],
        profileImage: imageUriResponse['data']['url']
      );
      print("유저 업데이트 코드: $userUpdateResponse");

      final reviewResponse = await UserAPI(context: context).getReview();
      final reviewCommentResponse =
          await UserAPI(context: context).getReviewCommentAll();

      for (int i = 0; i < reviewResponse.length; i++) {
        if (widget.idKey == reviewResponse[i]['gr_gu_seq_id']) {
          final updateResponse1 = await UserAPI(context: context).updateReview(
              name: reviewResponse[i]['gr_name'],
              place: reviewResponse[i]['gr_place'],
              contentText: reviewResponse[i]['gr_content_text'],
              grade: reviewResponse[i]['gr_grade'],
              date: reviewResponse[i]['gr_date'].toString(),
              contentImage: reviewResponse[i]['gr_content_image'],
              profileImage: imageUriResponse['data']['url'],
              pk: reviewResponse[i]['gr_seq'],
              fk: reviewResponse[i]['gr_gu_seq_id']);
          print("리뷰 업데이트 코드: $updateResponse1");
        }
      }

      for (int j = 0; j < reviewCommentResponse.length; j++) {
        if (userResponse['gu_name'] == reviewCommentResponse[j]['grc_name']) {
          final updateResponse2 = await UserAPI(context: context)
              .updateReviewComment(
                  name: reviewCommentResponse[j]['grc_name'],
                  profileImage: imageUriResponse['data']['url'],
                  commentText: reviewCommentResponse[j]['grc_comment'],
                  pk: reviewCommentResponse[j]['grc_seq'],
                  fk: reviewCommentResponse[j]['grc_gr_seq_id']);
          print("리뷰 코멘트 업데이트 코드: $updateResponse2");
        }
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CommonFrame1(
              idKey: widget.idKey,
              themeColor: widget.themeColor,
              title: "GROAD",
              clas: Home(
                userInfo: widget.userInfo,
                idKey: widget.idKey,
                mapType: settingResponse[
                'gs_map'],
                themeColor: settingResponse[
                'gs_theme'],
              ),
            ),
          ),
              (route) => false);

    });
  }
}
