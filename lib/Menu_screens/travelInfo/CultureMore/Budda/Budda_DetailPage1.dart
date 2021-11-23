import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/Main_screens/theme.dart';

class Budda_DetailPage1 extends StatelessWidget {
  const Budda_DetailPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 150.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '청평사',
                      style: TextStyle(
                        color: Color(deepNavy),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Container(
                    color: Color(deepNavy),
                    width: 199.0,
                    height: 3.0,
                  ),
                ],
              ),
            ), //청평사
            SizedBox(
              height: 23.0,
            ),
            Image.asset('assets/image10.png'),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 115.0,
                  height: 71.0,
                  color: Colors.grey[400],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '서브 이미지1',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 115.0,
                  height: 71.0,
                  color: Colors.grey[400],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '서브 이미지2',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 115.0,
                  height: 71.0,
                  color: Colors.grey[400],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '서브 이미지3',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ), //서브 이미지
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220.0),
              child: Text(
                '청평사 소개',
                style: TextStyle(
                  color: Color(deepNavy),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //청평사 소개
            SizedBox(
              height: 2.0,
            ),
            Container(
                width: screenSize.width * 0.9,
                height: 500.0,
                color: Colors.grey[400],
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Column(
                    children: [
                      Text(
                        '    청평사는 대한불교 조계종 제3교구 신흥사(新興寺)의 말사(末寺)이며 춘천을 대표하는 사찰입니다.',
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '    소양호 한쪽에 우뚝 솟아 있는 오봉산(과거 청평산ㆍ경운산)기슭에 자리했으며 고려 광종 24년(973년)에 창건되었으며 세 번의 중창과 조선명종 때 보우대사가 중건하여 대사찰이 되었습니다. 한국전쟁 때 거의 소실된 것을 1970년대에 전각들을 다시 짓고 회전문을 보수하고 범종각과 요사채를 앉혔습니다. ',
                        maxLines: 6,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '    천년이 넘은 고려선원(高麗禪園)의 정취와 흔적을 느낄 수 있으며 청평사를 포함한 주변 일대가 명승 제 70호로 지정되어 있습니다.',
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '    청평사의 현존건물로는 대웅전을 중심으로 극락보전, 삼성각, 회전문(廻轉門, 보불 제164호), 극락전, 나한전, 요사채 등이 있으며 문화유산으로는 공주와 상사뱀 설화, 강원도문화재자료 제8호인 삼층석탑(공주탑)을 비롯하여 문수원기, 진락공 부도(眞樂 公浮屠), 환적당 부도(幻寂 堂浮屠), 세향원 등이 있습니다.',
                        maxLines: 7,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '    다양한 교통수단 중 특히, 소양강댐에서 배를 타고 방문할 수 있어 일명 ‘섬 속의 절’이라고도 불리며 춘천의 필수 여행 코스 중 하나입니다.',
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )), //청평사 소개 글귀...
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 140.0),
              child: Text(
                '옛 사람의 청평사 유람기',
                style: TextStyle(
                  color: Color(deepNavy),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //옛 사람의 청평사 유람기
            SizedBox(
              height: 2.0,
            ),
            Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 320,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Column(
                  children: [
                    Text(
                      '    늦게 소양강을 건넜다. … 우두사를 지나 강을 따라 사십여리를 가노라니 산은 갈수록 높아지고 물살은 더욱더 빠른데 구름과 연기가 점점 자욱해지고 수풀의 나무들은 빽빽하다. 비스듬히 동쪽으로 난 길 하나가 바로 석문을 통과한다 지나는 곳마다 선경이 아닌 곳이 없다. 동구에 들어간지 두어 걸음도 안 되었는데 이어진 봉우리와 첩첩이 싸인 묏부리가 깎아지른 듯이 서서 만 겹으로 에워싸고 있다. 층진 바위와 어지럽게 흩어져있는 돌들이 쭈그려 앉은 듯, 튀어 오른 듯 하고 기이한 꽃들과 풀들이 때마침 불어오는 바람에 짙은 향기를 낸다. 환희현을 지나 폭포 옆의 대에 앉아 감상했다. … 운수교를 건너 보광문에 들어가니 바로 청평사의 절문이다.',
                      maxLines: 11,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '양대박,<금강산기행록>',
                          style: TextStyle(
                            color: Color(deepNavy),
                            fontSize: 11.0,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '1572년 4월 3일 아버지를 모시고 횡성, 홍천을 지나 4월 7일에 청평사를 찾은 기록',
                          maxLines: 2,
                          style: TextStyle(
                            color: Color(deepNavy),
                            fontSize: 11.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ), //옛 사람의 청평사 유람기 글귀...
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: Text(
                '김시습과 청평사',
                style: TextStyle(
                  color: Color(deepNavy),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //김시습과 청평사
            SizedBox(
              height: 6.0,
            ),
            Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 395,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '「청평산 세향원 남쪽 창에 쓰다」',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '아침 해 뜰 무렵 새벽빛 밝아오니,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '숲 안개 개는 곳에 새들이 짝 부르네.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '먼 산의 푸른빛은 창문을 열면 보이고,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '이웃 절 성근 종소리 산 너머로 들리네.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '파랑새는 소식 전하러 약 달이는 부엌 엿보고,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '벽도화(碧桃花) 꽃 떨어져 이끼와 어울리네.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '신선이 하늘에 조회하고 돌아왔는가.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '소나무 아래 한가로이 소전(小篆) 글씨 펼치니.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '석양으로 산 빛은 점점 붉어지는데,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '지친 새들 돌아갈 줄 알아 저녁 종소리 따르네.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '바둑판 그대로 둔 채 오는 손님 맞아들이고,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '청평사 선방 잠가두고 구름 짙길 기다리네.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '네모 못엔 천 길 산봉우리 비치고,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '절벽에선 만 길 물 내달리며 떨어지네.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '이것이 바로 청평산 선경(仙境)의 운치,',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '어이하여 시끄럽게 지난 행적 묻는가?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ), //김시습과 청평사 글귀...
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                    '청평사 관련 설화',
                    style: TextStyle(
                      color: Color(deepNavy),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Text(
                    '[ 공주와 상사뱀 ]',
                    style: TextStyle(
                      color: Color(deepNavy),
                    ),
                  )
                ],
              ),
            ), //청평사 관련 설화 [공주와 상사뱀]
            SizedBox(
              height: 20.0,
            ),
            Image.asset('assets/image9.png'),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 840.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                child: Column(
                  children: [
                    Text(
                      '    중국 원나라 순제의 딸은 매우 아름다운 미모를 갖추고 있었다. 궁중을 출입하는 자들은 하나같이 연정을 품고 있었지만, 신분의 차이가 있어 감히 마음을 표하지는 못하였다. 어느 날 한 말직의 청년 관리는 궁전 뜰을 거니는 공주의 모습을 보는 순간 짝사랑에 빠지고 말았다. 공주에게 사랑의 고백조차 할 수 없었던 그는 마침내 상사병을 앓다가 죽고 말았다. 청년은 죽는 그 순간 맹세를 했다. “이 세상에서 이루지 못한 사랑, 내 죽어서라도 그녀와 함께 하리라.”',
                      maxLines: 8,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '어느 날 낮잠에서 깨어난 공주는 몸이 이상하여 살펴보다가, 난데없이 뱀이 몸을 휘감고 있는 것을 보고 기겁을 하였다. 뱀은 밤이고 낮이고 떨어질 줄 몰랐다.',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '이 사실을 안 왕과 왕후가 갖은 방법을 동원하여 뱀을 쫒으려 하였지만, 그것도 잠시일 뿐 다시 공주의 몸을 휘감는 것이었다. 죽고만 싶었던 공주는 마침내 궁중을 뛰쳐나왔고, 죽기 전에 명산대천이나 유람하겠다며 중국 천지를 다 돌아 다녔다. 그리고 배를 타고 고려로 와서 금강산 구경 길에 올랐다가 청평사가 유명하다는 소문을 듣고 참배하고자 하였다.',
                      maxLines: 6,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '청평천을 건너 회전문 앞에 이르렀을 때 상사뱀은 공주가 걸음을 걷지 못하도록 요동을 쳤다. 10여 년 동안을 함께 있었지만 한번도 이와 같은 일은 없었으므로 공주는 이상히 여기며 타일렀다.',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '“나는 지난 10여 년 동안 한번도 너를 거슬려 본 적이 없었다. 그런데 너는 어찌하여 내가 좋아하는 절 구경을 못하게 하느냐? 만일 들어가기 싫거든 잠깐만 여기에 떨어져 있으라. 속히 절 구경을 하고 돌아와서 너와 함께 가리라.” 이 말을 들은 뱀은 곧 몸에서 떨어져 나왔고, 10년 만에 홀몸이 된 공주는 구성폭포를 맞으며 몸을 씻고 절 안으로 들어갔다. 법당과 절의 이곳저곳을 살피던 공주는 가사(袈裟)를 만들기 위해 아름다운 비단과 바늘이 널려 있는 방을 발견했다. 문득 이 세상에서 가장 거룩한 옷인 가사를 만들고 싶다는 충동으로 아무도 없는 그 방으로 들어간 공주는 열심히 바느질을 했다. 그리고는 황급히 뱀이 있는 곳으로 돌아갔다. 뱀이 다시 공주의 몸을 감으려 하는 순간, 갑자기 비바람이 몰아치면서 벼락이 떨어져 상사뱀이 새까맣게 태워 죽여 버렸다.',
                      maxLines: 13,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '마침내 뱀으로부터 해방된 공주는 부왕에게 자초지종을 아뢰었고, 순제는 부처의 은덕에 감사하며 이 절에 공주탑을 세웠다고 한다.',
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),  //청평사 관련설화 글귀...
          ],
        ),
      ),
    );
  }
}
