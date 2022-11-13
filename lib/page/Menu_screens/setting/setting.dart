import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/frame/common_frame1.dart';

import '../../../api/user_api.dart';
import '../../../component/common_button.dart';
import '../../../component/dialog/notify_dialog.dart';
import '../../Main_screens/home.dart';

class Setting extends StatefulWidget {
  Setting({Key key, this.idKey, this.settingInfo, this.themeColor})
      : super(key: key);

  int idKey;
  int themeColor;
  dynamic settingInfo;

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  dynamic userInfo;

  bool _isChecked1;
  bool _isChecked2;
  bool _isChecked3;

  List<bool> isSelected1;
  List<bool> isSelected2;
  int _selectedIndex1;
  int _selectedIndex2;
  int _selectedIndex3;
  int _selectedIndex4;
  int _selectedIndex5;
  bool map_flag = false;
  bool theme_flag = false;

  @override
  void initState() {
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    if (widget.settingInfo == null) {
      _isChecked1 = false;
      _isChecked2 = false;
      _isChecked3 = false;
      isSelected1 = [true, false, false];
      isSelected2 = [true, false, false];
      _selectedIndex1 = 0;
      _selectedIndex2 = 0;
      _selectedIndex3 = 0;
      _selectedIndex4 = 0;
      _selectedIndex5 = 0;
    } else {
      _selectedIndex1 = widget.settingInfo["gs_map"];
      _selectedIndex2 = widget.settingInfo["gs_theme"];
      _selectedIndex3 = widget.settingInfo["gs_onoff1"];
      _selectedIndex4 = widget.settingInfo["gs_onoff2"];
      _selectedIndex5 = widget.settingInfo["gs_onoff3"];

      if (_selectedIndex1 == 0) {
        isSelected1 = [true, false, false];
      } else if (_selectedIndex1 == 1) {
        isSelected1 = [false, true, false];
      } else {
        isSelected1 = [false, false, true];
      }

      if (_selectedIndex2 == 0) {
        isSelected2 = [true, false, false];
      } else if (_selectedIndex2 == 1) {
        isSelected2 = [false, true, false];
      } else {
        isSelected2 = [false, false, true];
      }

      _selectedIndex3 == 0 ? _isChecked1 = false : _isChecked1 = true;
      _selectedIndex4 == 0 ? _isChecked2 = false : _isChecked2 = true;
      _selectedIndex5 == 0 ? _isChecked3 = false : _isChecked3 = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: _fetchSettingInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Center(child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),);
          } else if (snapshot.hasError) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                  child: ListView(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.06,
                        child: ListTile(
                          title: Text(
                            '기능',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.08,
                        color: ThemeColors.white,
                        child: Center(
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              '지도 설정',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            trailing: map_flag
                                ? Icon(Icons.keyboard_arrow_up_sharp)
                                : Icon(Icons.keyboard_arrow_down_sharp),
                            onTap: () {
                              setState(() {
                                map_flag = !map_flag;
                              });
                            },
                          ),
                        ),
                      ), // 지도설정
                      map_flag
                          ? Container(
                              width: width,
                              height: height * 0.08,
                              child: ToggleButtons(
                                  selectedColor: widget.themeColor == 0
                                      ? ThemeColors.skyBlue
                                      : widget.themeColor == 1
                                          ? Color(0xFF90EE90)
                                          : Color(0xFFDAA520),
                                  isSelected: isSelected1,
                                  renderBorder: false,
                                  onPressed: (int newIndex) {
                                    setState(() {
                                      for (int index = 0;
                                          index < isSelected1.length;
                                          index++) {
                                        if (index == newIndex) {
                                          isSelected1[index] = true;
                                        } else {
                                          isSelected1[index] = false;
                                        }
                                      }
                                      _selectedIndex1 = newIndex;
                                    });
                                  },
                                  children: [
                                    Container(
                                      width: width / 3.018,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        '일반지도',
                                        style:
                                            TextStyle(color: ThemeColors.black),
                                      )),
                                    ),
                                    Container(
                                      width: width / 3.018,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        '위성지도',
                                        style:
                                            TextStyle(color: ThemeColors.black),
                                      )),
                                    ),
                                    Container(
                                      width: width / 3.018,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        '겹쳐보기',
                                        style:
                                            TextStyle(color: ThemeColors.black),
                                      )),
                                    ),
                                  ]),
                            )
                          : Container(
                              width: width,
                              height: 1,
                              color: Colors.grey[200],
                            ),
                      Container(
                        width: width,
                        height: height * 0.08,
                        color: ThemeColors.white,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              '테마 설정',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            trailing: theme_flag
                                ? Icon(Icons.keyboard_arrow_up_sharp)
                                : Icon(Icons.keyboard_arrow_down_sharp),
                            onTap: () {
                              setState(() {
                                theme_flag = !theme_flag;
                              });
                            },
                          ),
                        ),
                      ), // 테마설정
                      theme_flag
                          ? Container(
                              width: width,
                              height: height * 0.08,
                              child: ToggleButtons(
                                  selectedColor: widget.themeColor == 0
                                      ? ThemeColors.skyBlue
                                      : widget.themeColor == 1
                                          ? Color(0xFF90EE90)
                                          : Color(0xFFDAA520),
                                  isSelected: isSelected2,
                                  renderBorder: false,
                                  onPressed: (int newIndex) {
                                    // Respond to button selection
                                    setState(() {
                                      for (int index = 0;
                                          index < isSelected2.length;
                                          index++) {
                                        if (index == newIndex) {
                                          isSelected2[index] = true;
                                        } else {
                                          isSelected2[index] = false;
                                        }
                                      }
                                      _selectedIndex2 = newIndex;
                                    });
                                  },
                                  children: [
                                    Container(
                                      width: width / 3.018,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1),
                                              right: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        '파랑계열',
                                        style:
                                            TextStyle(color: ThemeColors.black),
                                      )),
                                    ),
                                    Container(
                                      width: width / 3.018,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1),
                                              right: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        '초록계열',
                                        style:
                                            TextStyle(color: ThemeColors.black),
                                      )),
                                    ),
                                    Container(
                                      width: width / 3.018,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1),
                                              right: BorderSide(
                                                  color: ThemeColors.gray1,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        '오렌지계열',
                                        style:
                                            TextStyle(color: ThemeColors.black),
                                      )),
                                    ),
                                  ]),
                            )
                          : Container(
                              width: width,
                              height: 1,
                              color: Colors.grey[200],
                            ),
                      Container(
                        width: width,
                        height: height * 0.06,
                        child: ListTile(
                          title: Text(
                            '알림',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.11,
                        color: ThemeColors.white,
                        child: Center(
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              '이벤트 혜택',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(left: width * 0.005),
                              child: Text('쿠폰 및 마케팅 정보 알림'),
                            ),
                            trailing: Switch(
                              activeColor: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                              value: _isChecked1,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked1 = value;
                                  if (_isChecked1 == false) {
                                    _selectedIndex3 = 0;
                                  } else {
                                    _selectedIndex3 = 1;
                                  }
                                });
                              },
                            ),
                            onTap: () {},
                          ),
                        ),
                      ), // 이벤트 혜택
                      Container(
                        width: width,
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      Container(
                        width: width,
                        height: height * 0.11,
                        color: ThemeColors.white,
                        child: Center(
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              '리뷰 댓글',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(left: width * 0.005),
                              child: Text('내 리뷰에 달린 댓글 알림'),
                            ),
                            trailing: Switch(
                              activeColor: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                              value: _isChecked2,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked2 = value;
                                  if (_isChecked2 == false) {
                                    _selectedIndex4 = 0;
                                  } else {
                                    _selectedIndex4 = 1;
                                  }
                                });
                              },
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      Container(
                        width: width,
                        height: height * 0.11,
                        color: ThemeColors.white,
                        child: Center(
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              '위치',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.005, top: height * 0.004),
                              child: Text('내 실시간 위치정보 동기화'),
                            ),
                            trailing: Switch(
                              activeColor: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                              value: _isChecked3,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked3 = value;
                                  if (_isChecked3 == false) {
                                    _selectedIndex5 = 0;
                                  } else {
                                    _selectedIndex5 = 1;
                                  }
                                });
                              },
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CommonButton(
                        themeColor: widget.themeColor,
                        label: '확인',
                        onPress: () async {
                          print("업데이트창;;;;");
                          await UserAPI(context: context).updateSetting(
                              map: _selectedIndex1,
                              themeColor: _selectedIndex2,
                              onoff1: _selectedIndex3,
                              onoff2: _selectedIndex4,
                              onoff3: _selectedIndex5,
                              fk: widget.idKey);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => CommonFrame1(
                                  userInfo: userInfo,
                                  idKey: widget.idKey,
                                  mapType: _selectedIndex1,
                                  themeColor: _selectedIndex2,
                                  title: "GROAD",
                                  clas: Home(
                                    userInfo: userInfo,
                                    idKey: widget.idKey,
                                    mapType: _selectedIndex1,
                                    themeColor: _selectedIndex2,
                                  ),
                                ),
                              ),
                              (route) => false);
                          NotifyDialog.show(context,
                              style: TextStyle(
                                  fontSize: 50,
                                  color: ThemeColors.black,
                                  height: 23 / 18),
                              message: '설정이 완료되었습니다.');
                        },
                      )
                    ],
                  )),
            );
          }
        });
  }

  Future<dynamic> _fetchSettingInfo() async {
    final settingInfo = await UserAPI(context: context).getSetting(fk: widget.idKey);
    userInfo = await UserAPI(context: context).getUser(pk: widget.idKey);
    return settingInfo;
  }
}
