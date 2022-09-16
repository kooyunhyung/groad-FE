import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/theme.dart';
import 'package:gload_app/page/Menu_screens/travelAssistant/digitalPassport.dart';
import 'materials.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  List<bool> isSelected = [true, false, false];
  var _selectedIndex = 0;
  var _contents = [
    _TermsOfUse(), //0번인덱스
    Materials(), //1번 인덱스
    DigitalPassport(), //2번 인덱스
  ];

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return Column(
      children: [
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 25.0, top: 30.0),
            //color: Colors.grey[100],
            width: screenSize.width,
            height: screenSize.height * 0.13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '여행도우미',
                  style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Color(deepNavy),
                  width: 128.0,
                  height: 3.0,
                ),
              ],
            ),
          ),
        ), //여행도우미
        Container(
          color: Colors.grey[400],
          child: ToggleButtons(
            selectedColor: Colors.grey[200],
            fillColor: Colors.grey[200],
            splashColor: Colors.grey[200],
            focusColor: Colors.grey[200],
            hoverColor: Colors.white,
            borderRadius: BorderRadius.circular(0.0),
            constraints: BoxConstraints(minHeight: 36.0),
            isSelected: isSelected,
            renderBorder: false,
            onPressed: (int newIndex) {
              // Respond to button selection
              setState(() {
                for (int index = 0; index < isSelected.length; index++) {
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.0828),
                child: Text(
                  '이용수칙',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.087),
                child: Text(
                  '준비물',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.04),
                child: Text(
                  '디지털 패스포트',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ), //토글 버튼
        Container(
            color: Colors.grey[200],
            width: screenSize.width,
            height: screenSize.height * 0.628,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _contents[_selectedIndex],
            ))
      ],
    );
  }
}

Widget _TermsOfUse() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.0,),
        Row(
          children: [
            Container(
              color: Colors.grey[400],
              width: 84.0,
              height: 84.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '픽토그램',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '캐릭터',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[400],
                  width: 84.0,
                  height: 24.0,
                  child: Center(
                    child: Text(
                      '손씻기!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '손을 씻는 행위는 아주 중요합니다!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  color: Colors.grey[400],
                  width: 240.0,
                  height: 14.0,
                  child: Center(
                    child: Text(
                      '서브 설명 텍스트',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
