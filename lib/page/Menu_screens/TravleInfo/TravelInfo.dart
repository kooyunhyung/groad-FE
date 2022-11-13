import 'package:flutter/material.dart';
import 'shortDistanceCourse.dart';
import 'package:gload_app/constant/theme.dart';
import 'localCourse.dart';
import 'longDistanceCourse.dart';
import 'mainCourse.dart';

class TravelInfo extends StatefulWidget {
  TravelInfo({Key key,this.courseInfoList, this.themeColor})
      : super(key: key);

  dynamic courseInfoList;
  int themeColor;

  @override
  State<TravelInfo> createState() => _TravelInfoState();
}

class _TravelInfoState extends State<TravelInfo> {
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
    List<String> categories = ["메인 추천 코스", "장거리 코스", "단거리 코스", "지역별 코스"];
    return DefaultTabController(
      initialIndex: 0,
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.3, color: Colors.grey)),
                  color: Colors.white),
              child: TabBar(
                tabs: List.generate(
                  categories.length,
                      (index) => Tab(
                    text: categories[index],
                  ),
                ),
                isScrollable: true,
                labelColor: widget.themeColor == 0
                    ? Color(ThemeColors.deepNavy)
                    : widget.themeColor == 1
                    ? ThemeColors.deepGreen
                    : ThemeColors.deepOrange,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextTheme().headline2?.copyWith(
                    color: widget.themeColor == 0
                        ? Color(ThemeColors.deepNavy)
                        : widget.themeColor == 1
                        ? ThemeColors.deepGreen
                        : ThemeColors.deepOrange, fontWeight: FontWeight.bold),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 4, color: widget.themeColor == 0
                        ? Color(ThemeColors.deepNavy)
                        : widget.themeColor == 1
                        ? ThemeColors.deepGreen
                        : ThemeColors.deepOrange,)),
              ),
            ),
            preferredSize: Size.fromHeight(0.0),
          ),
        ),
        body: TabBarView(
            children: [
              MainCourse(themeColor:widget.themeColor),
              LongDistanceCourse(themeColor:widget.themeColor),
              ShortDistanceCourse(themeColor: widget.themeColor),
              LocalCourse(themeColor: widget.themeColor),
            ]
        ),
      ),
    );
  }
}
