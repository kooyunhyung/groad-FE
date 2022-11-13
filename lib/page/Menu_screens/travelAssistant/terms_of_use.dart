import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsOfUse extends StatefulWidget {
  TermsOfUse({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  void initState() {
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/speaker.png')),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              '순례길 및 숲길 탐방시, 안전수칙을 지켜주세요',
              style: TextStyle(
                fontSize: 18,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              '- 혼자 걸으실 경우, 출발 시점에 춘천관광 콜센터 033-OOO-OOOO로 연락주세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 여행 일정과 숙소, 행선지 등을 주변인에게 수시로 알리세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 유사시에 대비하여 휴대전화 GPS 등 위치기반 서비스를 항상 켜 두세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 인적이 드물고 외진 관광길은 가급적 2인 이상 동행하세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 하절기 6시, 동절기 5시 이후 걷기를 자제해 주세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 코스를 벗어난 가파른 계곡이나 절벽 등으로의 모험을 피해주세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- GROAD 표식을 놓쳤을 때는 마지막 표식을 본 자리로 되돌아가 표식을 다시 찾아보세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 현재거리 플레이트에 있는 남은거리 및 주변 위치정보(건물명 등)를 숙지하며 걸어주세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 풀밭에서 휴식을 취할 경우 야생진드기 물림에 주의하세요.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '- 안전한 GROAD 탐방을 위해 춘천여행지킴이 대여를 권장해드립니다.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
