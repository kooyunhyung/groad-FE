import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';

import '../../../models/question_text_menu.dart';

class Question extends StatefulWidget {
  Question({Key key,this.themeColor}) : super(key: key);

  int themeColor;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<bool> isSelected = [true, false, false, false];
  var _selectedIndex = 0;
  bool Q_sign1 = false;
  bool Q_sign2 = false;
  bool Q_sign3 = false;
  bool Q_sign4 = false;
  bool Q_pass1 = false;
  bool Q_pass2 = false;
  bool Q_pass3 = false;
  bool Q_point1 = false;
  bool Q_point2 = false;
  bool Q_point3 = false;
  bool Q_etc1 = false;
  bool Q_etc2 = false;

  @override
  void initState() {
    if(widget.themeColor==null){
      widget.themeColor=0;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var _contents = [
      _SignQuestion(context),
      _PassportQuestion(context),
      _PointQuestion(context),
      _EtcQuestion(context)
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: ThemeColors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: width * 0.9,
              height: height * 0.06752,
              decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.gray1),
                  color: ThemeColors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ToggleButtons(
                      selectedColor: widget.themeColor == 0
                          ? ThemeColors.skyBlue
                          : widget.themeColor == 1
                          ? Color(0xFF90EE90)
                          : Color(0xFFDAA520),
                      isSelected: isSelected,
                      renderBorder: false,
                      onPressed: (int newIndex) {
                        // Respond to button selection
                        setState(() {
                          for (int index = 0;
                              index < isSelected.length;
                              index++) {
                            if (index == newIndex) {
                              isSelected[index] = true;
                            } else {
                              isSelected[index] = false;
                            }
                          }
                          _selectedIndex = newIndex;
                        });
                      },
                      children: [
                        Container(
                          width: (width * 0.9) / 4.018,
                          height: (height * 0.13) / 2,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: ThemeColors.gray1, width: 1))),
                          child: Center(
                              child: Text(
                            '가입/탈퇴',
                            style: TextStyle(color: ThemeColors.black),
                          )),
                        ),
                        Container(
                          width: (width * 0.9) / 4.018,
                          height: (height * 0.13) / 2,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: ThemeColors.gray1, width: 1))),
                          child: Center(
                              child: Text(
                            '패스포트',
                            style: TextStyle(color: ThemeColors.black),
                          )),
                        ),
                        Container(
                          width: (width * 0.9) / 4.018,
                          height: (height * 0.13) / 2.09,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: ThemeColors.gray1, width: 1))),
                          child: Center(
                              child: Text(
                            '포인트',
                            style: TextStyle(color: ThemeColors.black),
                          )),
                        ),
                        Container(
                          width: (width * 0.9) / 4.04,
                          height: (height * 0.13) / 2.09,
                          child: Center(
                              child: Text(
                            '기타',
                            style: TextStyle(color: ThemeColors.black),
                          )),
                        )
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: width * 0.9,
              height: 1,
              color: ThemeColors.gray1,
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  width: width * 0.9,
                  height: height * 0.7,
                  color: ThemeColors.white,
                  child: _contents[_selectedIndex]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _SignQuestion(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList1[0].text),
          trailing: Q_sign1
              ? Icon(Icons.keyboard_arrow_up_sharp)
              : Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_sign1 = !Q_sign1;
            });
          },
        ),
        Q_sign1
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                width: width * 0.9,
                height: height * 0.08,
                color: ThemeColors.gray1,
                child: Text(AMenuList1[0].text),
              )
            : Container(
                width: width * 0.9,
                height: 1,
                color: ThemeColors.gray1,
              ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList1[1].text),
          trailing: Q_sign2
              ? Icon(Icons.keyboard_arrow_up_sharp)
              : Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_sign2 = !Q_sign2;
            });
          },
        ),
        Q_sign2
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                width: width * 0.9,
                height: height * 0.06,
                color: ThemeColors.gray1,
                child: Text(AMenuList1[1].text),
              )
            : Container(
                width: width * 0.9,
                height: 1,
                color: ThemeColors.gray1,
              ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList1[2].text),
          trailing: Q_sign3
              ? Icon(Icons.keyboard_arrow_up_sharp)
              : Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_sign3 = !Q_sign3;
            });
          },
        ),
        Q_sign3
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                width: width * 0.9,
                height: height * 0.06,
                color: ThemeColors.gray1,
                child: Text(AMenuList1[2].text),
              )
            : Container(
                width: width * 0.9,
                height: 1,
                color: ThemeColors.gray1,
              ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList1[3].text),
          trailing: Q_sign4
              ? Icon(Icons.keyboard_arrow_up_sharp)
              : Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_sign4 = !Q_sign4;
            });
          },
        ),
        Q_sign4
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                width: width * 0.9,
                height: height * 0.06,
                color: ThemeColors.gray1,
                child: Text(AMenuList1[3].text),
              )
            : Container(
                width: width * 0.9,
                height: 1,
                color: ThemeColors.gray1,
              ),
      ],
    );
  }

  Widget _PassportQuestion(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList2[0].text),
          trailing: Q_pass1? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: (){
            setState(() {
              Q_pass1 = !Q_pass1;
            });
          },
        ),
        Q_pass1
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.13,
          color: ThemeColors.gray1,
          child: Text(AMenuList2[0].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList2[1].text),
          trailing: Q_pass2? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_pass2 = !Q_pass2;
            });
          },
        ),
        Q_pass2
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.06,
          color: ThemeColors.gray1,
          child: Text(AMenuList2[1].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList2[2].text),
          trailing: Q_pass3? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_pass3 = !Q_pass3;
            });
          },
        ),
        Q_pass3
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.06,
          color: ThemeColors.gray1,
          child: Text(AMenuList2[2].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
      ],
    );
  }

  Widget _PointQuestion(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList3[0].text),
          trailing: Q_point1? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: (){
            setState(() {
              Q_point1= !Q_point1;
            });
          },
        ),
        Q_point1
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.06,
          color: ThemeColors.gray1,
          child: Text(AMenuList3[0].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList3[1].text),
          trailing: Q_point2? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: (){
            setState(() {
              Q_point2 = !Q_point2;
            });
          },
        ),
        Q_point2
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.06,
          color: ThemeColors.gray1,
          child: Text(AMenuList3[1].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList3[2].text),
          trailing: Q_point3? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_point3 = !Q_point3;
            });
          },
        ),
        Q_point3
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.06,
          color: ThemeColors.gray1,
          child: Text(AMenuList3[2].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
      ],
    );
  }

  Widget _EtcQuestion(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList4[0].text),
          trailing: Q_etc1? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: (){
            setState(() {
              Q_etc1 = !Q_etc1;
            });
          },
        ),
        Q_etc1
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.06,
          color: ThemeColors.gray1,
          child: Text(AMenuList4[0].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
        ListTile(
          leading: Text(
            'Q.',
            style: TextStyle(
                color: widget.themeColor == 0
                    ? ThemeColors.skyBlue
                    : widget.themeColor == 1
                    ? Color(0xFF90EE90)
                    : Color(0xFFDAA520),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          title: Text(QMenuList4[1].text),
          trailing: Q_etc2? Icon(Icons.keyboard_arrow_up_sharp):Icon(Icons.keyboard_arrow_down_sharp),
          onTap: () {
            setState(() {
              Q_etc2 = !Q_etc2;
            });
          },
        ),
        Q_etc2
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          width: width * 0.9,
          height: height * 0.16,
          color: ThemeColors.gray1,
          child: Text(AMenuList4[1].text),
        )
            : Container(
          width: width * 0.9,
          height: 1,
          color: ThemeColors.gray1,
        ),
      ],
    );
  }
}
