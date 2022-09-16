import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/theme.dart';

class Confucianism_DetailPage1 extends StatelessWidget {
  const Confucianism_DetailPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                      '소양정',
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
            ), //소양정
            SizedBox(
              height: 23.0,
            ),
            Image.asset('assets/image11.png'),
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
                '소양정 소개',
                style: TextStyle(
                  color: Color(deepNavy),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //소양정 소개
            SizedBox(
              height: 2.0,
            ),
            Container(
                width: screenSize.width * 0.9,
                height: 275.0,
                color: Colors.grey[400],
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Column(
                    children: [
                      Text(
                        '    소양1교 남쪽 절벽 위에 건립되어 있는 2층 누각이다. 1530년(중종25) 편찬된 『신증동국여지승람』에는 이요루(二樂樓)라 하였고, 그 이전에는 소양정이라 하였다고 한다. 소양정은 소양강가에 있었기 때문에 홍수가 나면 떠내려가는 경우가 많아, 1605년(선조38)에 유실된 것을 춘천부사 유희담이 1610년(광해군2)에 중건하고, 1647년(인조25) 엄황이 중수했으며 1777년(정조1) 다시 홍수로 떠내려가자 1780년(정조4)에 이동형이 옛 터의 서쪽 수백 보 지점에 중건했다고 한다. 현재의 소양정은 한국전쟁 때 소실된 것을 1966년 현재의 자리로 새로 옮겨 지은 것이다.',
                        maxLines: 10,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Text(
                        '소양정을 유람하거나 중수하면서 남긴 기문이 여럿 남아있다.',
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )), //소양정 소개 글귀...
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 140.0),
              child: Text(
                '옛 사람의 소양정 유람기',
                style: TextStyle(
                  color: Color(deepNavy),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //옛 사람의 소양정 유람기
            SizedBox(
              height: 2.0,
            ),
            Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 200,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Column(
                  children: [
                    Text(
                      '    이 해 한여름에 나는 춘천으로 가는 길에 병이 들었다. 그러나 소양강을 한번 지나고자 하여 돌아가는 길에 소양정에 이르렀다. 정자는 강에 임하여 있어서 환하게 터져있다. 멀리 보이는 산으로 동북방에 위엄있는 산이 많은데, 물가의 사람이 저것이 청평산이라 한다. 나는 눈이 열리고 심장이 뛰어서 술이 깨듯 아픈 것이 흩어지는 것을 깨닫지 못하였다.',
                      maxLines: 7,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 230.0),
                      child: Text(
                        '안석경,<유청평산기>',
                        style: TextStyle(
                          color: Color(deepNavy),
                          fontSize: 11.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ), //옛 사람의 소양정 유람기 글귀...
            SizedBox(
              height: 25.0,
            ),
            Container(
              color: Colors.grey[400],
              width: screenSize.width * 0.9,
              height: 670,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '    걸음을 재촉하여 소양정(昭陽亭)에 올라갔다. 정자는 봉의산(鳳儀山) 북쪽에 있었는데, 치소(治所)로부터의 거리가 5리쯤 되었다. 긴 강물이 내려다보이며, 앞에는 널따란 들판이 펼쳐져 있었다. 가까이로는 암동(巖洞)에 의지해 있고 멀리로는 뭇 산봉우리를 끌어당겨 청신하고 안온하며 그윽하고 먼 경치를 이루 다 기술할 수가 없었다. 일찍이 강호(江湖)와 누관(樓觀)의 경치가 한 지방에서 으뜸이 되는 곳을 논해 보건데, 내가 둘러본 바로는 연광정(練光亭)은 눈에 꽉 차고 마음에 들어맞아 사람들로 하여금 즐거운 마음이 들어 돌아갈 생각이 나지 않게 하나, 여염집들이 너무 가까이에 있어 초연히 티끌 세상을 벗어난 듯한 점이 부족하였다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '    백상루(百祥樓)는 굉대하고 드넓으며 장대하고 화려하여 호호하기가 마치 허공 위에 앉아 있는 것만 같으나, 관새(關塞)의 감개한 생각이 일어나게 하였다. 강선루(降仙樓)는 맑은 시내와 높은 절벽이 있어 난간의 모습이 물에 비치며, 그윽하고 고요하며 아득하고 멀어서 사철의 경치에 모두 마땅하나, 창활하고 드넓은 즐거움이 없었다. 낙민정(樂民亭)은 굉대하고 공활하기는 백상루와 비슷하고 안온하고 상쾌하기는 연광정만 못하며, 여염집이 가까운 것과 관새 지방의 감개가 이는 하자를 모두 겸하고 있었다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '    청심루(淸心樓)는 관촌(官村)을 끼고 있으나 그 가까운 것이 싫지 않고 뭇 산들이 둘러쳐져 있으면서도 그 막힌 것을 깨닫지 못하겠는바 드넓어서 통창하고 숙연하여 고요하나, 의논할 만한 점은 하늘이 만들어 내고 땅이 베푼 자연이 위에서 말한 여러 명승지에 미치지 못하였다. 그러니 필경에 갑이냐 을이냐 하는 순서를 따짐에 있어서 누가 가장 앞쪽에 거처하겠는가. 신유(神遊)와 몽상(夢想)은 아마도 이 정자에 있을 것이다. 안목을 갖춘 자가 뒷날에 확실하게 논하기를 기다린다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
