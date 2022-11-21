import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/traveler_review_detail.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/traveler_review_write.dart';

import '../../../constant/theme.dart';

class TravelerReview extends StatefulWidget {
  TravelerReview({Key key,this.idKey, this.userInfo, this.mapType, this.themeColor}) : super(key: key);

  int idKey;
  dynamic userInfo;
  int mapType;
  int themeColor;

  @override
  _TravelerReviewState createState() => _TravelerReviewState();
}

class _TravelerReviewState extends State<TravelerReview> {
  @override
  void initState() {
    if(widget.mapType==null){
      widget.mapType=0;
    }
    if(widget.idKey==null){
      widget.idKey=-1;
    }
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

    List<String> categories = ['여행자들의 후기', '후기 작성'];

    return DefaultTabController(
        initialIndex: 0,
        length: categories.length,
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: ThemeColors.white,
              bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(width: 0.7, color: ThemeColors.gray1)),
                      color: ThemeColors.white),
                  child: TabBar(
                      tabs: List.generate(
                          categories.length,
                              (index) => Tab(
                            text: categories[index],
                          )),
                      isScrollable: false,
                      labelColor: widget.themeColor == 0
                          ? Color(ThemeColors.deepNavy)
                          : widget.themeColor == 1
                          ? ThemeColors.deepGreen
                          : ThemeColors.deepOrange,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      unselectedLabelColor: ThemeColors.gray1,
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 4, color: widget.themeColor == 0
                              ? Color(ThemeColors.deepNavy)
                              : widget.themeColor == 1
                              ? ThemeColors.deepGreen
                              : ThemeColors.deepOrange,))),
                ),
                preferredSize: Size.fromHeight(0.0),
              )),
          body: TabBarView(children: [
            TravelerReviewDetail(idKey: widget.idKey, userInfo: widget.userInfo, themeColor: widget.themeColor,),
            TravelerReviewWrite(idKey:widget.idKey, userInfo: widget.userInfo,mapType: widget.mapType, themeColor: widget.themeColor),
          ]),
        ));
  }
}
