import 'package:flutter/material.dart';

import '../../../constant/theme.dart';

class TravelMaterial extends StatefulWidget {
  TravelMaterial({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  _TravelMaterialState createState() => _TravelMaterialState();
}

class _TravelMaterialState extends State<TravelMaterial> {
  @override
  void initState() {
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.account_box_outlined,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '신분증',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                '여행에 있어 본인 확인이나 특히, 비행기 이용 시 신분증은 필수이니 꼭 챙겨주세요.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text('지갑',
                              style: TextStyle(
                                fontSize: 23,
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                  '지갑은 큰 틀입니다. 그 안에 들어있는 신분증, 신용카드, 현금 등을 상징하죠. 특히, 현금을 일정 금액 챙겨가실 것을 추천드립니다.',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600])))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.airplane_ticket,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '예약관련',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                '숙박, 레저, 체험 활동 등 각종 예약 관련 e-ticket을 미리 점검하시고, 카카오톡, 메일 등 스마트폰 사용이 어려울 시 확인할 수 있는 방법을 미리 마련하는 것입니다.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.wash,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text('피부관련',
                              style: TextStyle(
                                fontSize: 23,
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                  '2박 3일, 3박 4일 등 이상 장기 여행 준비 중이라면 1회용 화장품 용기에 담아서 부피를 줄이는 것도 한 방법입니다. 이는 개인 샴푸, 바디워시 등 활용 분야를 넓힐 수 있습니다.',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600])))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '스마트폰',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                '스마트폰은 여행에서도 훌륭한 도구입니다. 사진은 물론, 맛집 위치, 날씨 등 활용 분야가 무궁무진합니다. 똑똑한 제품이 제대로 작동하도록 충전기, 보조배터리는 필수겠죠?',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text('사진',
                              style: TextStyle(
                                fontSize: 23,
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                  '전용 카메라가 있다면 반드시 챙기시고 삼각대까지 있으면 이쁘고 다채로운 사진을 남길 수 있겠네요!',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600])))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.checkroom_outlined,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '의류',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                '지역 탐방, 맛집 탐방 등 여행지에서 입을 예쁜 옷을 골라보세요. 휴식할 동안에는 편하게 있을 수 있도록 운동복과 같은 편한 복장도 챙겨보시는 것도 좋습니다.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.medical_services_outlined,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text('비상약',
                              style: TextStyle(
                                fontSize: 23,
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                  '비상약뿐만 아니라 본인이 평소에 챙겨 먹어야 하는 약이나 영양제도 챙기시길 바랍니다. 요즘 데일리 약통도 있으니 필요한 약만 여행 일정에 맞게 챙겨가실 수 있습니다',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600])))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.child_care_sharp,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '아이관련',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                '아이가 어느 정도 자라면 함께 여행을 하면 아이 정서에도 도움이 된다고 합니다. 그렇다고 아이 용품을 다 챙겨갈 수 없으니 꼭 필요한 물건은 없는지 체크해보세요!',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.sports_basketball_rounded,
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 120,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text('레저관련',
                              style: TextStyle(
                                fontSize: 23,
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                              width: width * 0.4,
                              child: Text(
                                  '각 레저 여행 컨셉에 맞게 준비물을 꼭 챙겨 보세요. 특히 레저 여행에서 준비물을 못 챙기면 예상 못 한 지출이 생길 수 있으니 주의하세요!',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600])))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
              ],
            )));
  }
}
