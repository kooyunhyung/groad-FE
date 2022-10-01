import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  List<bool> isSelected1 = [true, false, false];
  List<bool> isSelected2 = [true, false, false];
  var _selectedIndex1 = 0;
  var _selectedIndex2 = 0;
  bool map_flag = false;
  bool theme_flag = false;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                height: height*0.06,
                child: ListTile(
                  title: Text('기능',style: TextStyle(color: Colors.grey[700]),),
                ),
              ),
              Container(
                width: width,
                height: height* 0.08,
                color: ThemeColors.white,
                child: Center(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text('지도 설정',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    trailing: map_flag? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
                    onTap: () {
                      setState(() {
                        map_flag = !map_flag;
                      });
                    },
                  ),
                ),
              ),  // 지도설정
              map_flag? Container(
                width: width,
                height: height*0.08,
                child: ToggleButtons(
                    selectedColor: ThemeColors.skyBlue,
                    isSelected: isSelected1,
                    renderBorder: false,
                    onPressed: (int newIndex) {
                      // Respond to button selection
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
                                    color: ThemeColors.gray1, width: 1))),
                        child: Center(
                            child: Text(
                              '일반지도',
                              style: TextStyle(color: ThemeColors.black),
                            )),
                      ),
                      Container(
                        width: width / 3.018,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: ThemeColors.gray1, width: 1))),
                        child: Center(
                            child: Text(
                              '위성지도',
                              style: TextStyle(color: ThemeColors.black),
                            )),
                      ),
                      Container(
                        width: width / 3.018,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: ThemeColors.gray1, width: 1))),
                        child: Center(
                            child: Text(
                              '겹쳐보기',
                              style: TextStyle(color: ThemeColors.black),
                            )),
                      ),
                    ]),
              ):Container(
                width: width,
                height: 1,
                color: Colors.grey[200],
              ),
              Container(
                width: width,
                height: height* 0.08,
                color: ThemeColors.white,
                child: Center(
                  child: ListTile(
                    title: Text('테마 설정',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    trailing: theme_flag? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
                    onTap: () {
                      setState(() {
                        theme_flag = !theme_flag;
                      });
                },
                  ),
                ),
              ),   // 테마설정
              theme_flag? Container(
                width: width,
                height: height*0.08,
                child: ToggleButtons(
                    selectedColor: ThemeColors.skyBlue,
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
                                          color: ThemeColors.gray1, width: 1),
                                      right: BorderSide(
                                    color: ThemeColors.gray1, width: 1))),
                        child: Center(
                            child: Text(
                              '파랑계열',
                              style: TextStyle(color: ThemeColors.black),
                            )),
                      ),
                      Container(
                        width: width / 3.018,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ThemeColors.gray1, width: 1),
                                right: BorderSide(
                                    color: ThemeColors.gray1, width: 1))),
                        child: Center(
                            child: Text(
                              '초록계열',
                              style: TextStyle(color: ThemeColors.black),
                            )),
                      ),
                      Container(
                        width: width / 3.018,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ThemeColors.gray1, width: 1),
                                right: BorderSide(
                                    color: ThemeColors.gray1, width: 1))),
                        child: Center(
                            child: Text(
                              '오렌지계열',
                              style: TextStyle(color: ThemeColors.black),
                            )),
                      ),
                    ]),
              ):Container(
                width: width,
                height: 1,
                color: Colors.grey[200],
              ),
              Container(
                width: width,
                height: height*0.06,
                child: ListTile(
                  title: Text('알림',style: TextStyle(color: Colors.grey[700]),),
                ),
              ),
              Container(
                width: width,
                height: height* 0.11,
                color: ThemeColors.white,
                child: Center(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text('이벤트 혜택',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    subtitle: Padding(
                      padding: EdgeInsets.only(left: width*0.005),
                      child: Text('쿠폰 및 마케팅 정보 알림'),
                    ),
                    trailing: Switch(
                      activeColor: Color(ThemeColors.deepNavy),
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value;
                        });
                      },
                    ),
                    onTap: () {},
                  ),
                ),
              ),  // 이벤트 혜택
              Container(
                width: width,
                height: 1,
                color: Colors.grey[200],
              ),
              Container(
                width: width,
                height: height* 0.11,
                color: ThemeColors.white,
                child: Center(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text('리뷰 댓글',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    subtitle: Padding(
                      padding: EdgeInsets.only(left: width*0.005),
                      child: Text('내 리뷰에 달린 댓글 알림'),
                    ),
                    trailing: Switch(
                      activeColor: Color(ThemeColors.deepNavy),
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value;
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
                height: height* 0.11,
                color: ThemeColors.white,
                child: Center(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text('위치',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    subtitle: Padding(
                      padding: EdgeInsets.only(left: width*0.005,top: height*0.004),
                      child: Text('내 실시간 위치정보 동기화'),
                    ),
                    trailing: Switch(
                      activeColor: Color(ThemeColors.deepNavy),
                      value: _isChecked3,
                      onChanged: (value) {
                        setState(() {
                          _isChecked3 = value;
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
            ],
          )),
    );
  }
}
