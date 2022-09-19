import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/TourCourse/components/round_border_text.dart';
import 'package:gload_app/constant/theme.dart';

class MainCourse extends StatelessWidget {
  const MainCourse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List searchKeyword = ['전체','춘천','강릉','원주','양양'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: ListView(
        children: [
          SizedBox(
            height: 66,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchKeyword.length,
              itemBuilder: (context,index){
                return Center(
                  child: RoundBorderText(
                    title: searchKeyword[index],
                    position: index,
                  ),
                );
              },
            ),
          ), //전체, 춘천, 강릉, 원주, 양양
          SizedBox(
            height: 15.0,
          ),
          Image.asset('assets/image7.png'), //코스 이미지1
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Text(
                "춘천 사색의 길",
                style: TextStyle(
                  color: Color(deepNavy),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "12.9Km",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 120.0,
              ),
              Icon(
                Icons.access_time_outlined,
                color: Colors.grey[400],
              ),
              SizedBox(
                width: 3.0,
              ),
              Text(
                "4:30",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ), //춘천 사색의 길
          SizedBox(
            height: 20.0,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Center(
                  child: Container(
                    color: Color(lightSky),
                    width: 333.0,
                    height: 1.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 35.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                ],
              )
            ],
          ), //코스 선(그림)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "춘천역",
                style: TextStyle(
                  color: Color(deepNavy),
                  fontSize: 12.0
                ),
              ),
              Text(
                "옛산길",
                style: TextStyle(
                  color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "고개마루에서 직진",
                style: TextStyle(
                  color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "미나리폭포",
                style: TextStyle(
                  color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "소양로 성당",
                style: TextStyle(
                  color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
            ],
          ),  //춘천역 옛산길 고개마루에서 직진
          SizedBox(height: 25.0,),
          Container(
            width: 361,
            height: 1.0,
            color: Colors.grey,
          ),  //회색 구분 선
          SizedBox(height: 25.0,),
          Image.asset('assets/image8.png'), //코스 이미지2
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Text(
                "의암 순례길",
                style: TextStyle(
                  color: Color(deepNavy),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "12.9Km",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 140.0,
              ),
              Icon(
                Icons.access_time_outlined,
                color: Colors.grey[400],
              ),
              SizedBox(
                width: 3.0,
              ),
              Text(
                "4:30",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ), //의암 순례길
          SizedBox(
            height: 20.0,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Center(
                  child: Container(
                    color: Color(lightSky),
                    width: 333.0,
                    height: 1.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 35.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(lightSky),
                    size: 10.0,
                  ),
                ],
              )
            ],
          ), //코스 선(그림)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "춘천역",
                style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "옛산길",
                style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "고개마루에서 직진",
                style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "미나리폭포",
                style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
              Text(
                "쟁골교",
                style: TextStyle(
                    color: Color(deepNavy),
                    fontSize: 12.0
                ),
              ),
            ],
          ),  //춘천역 옛산길 고개마루에서 직진 ... 쟁골교
          SizedBox(height: 25.0,),
        ],
      ),
    );
  }
}
