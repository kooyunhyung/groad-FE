import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/traveler_review_detail.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/traveler_review_write.dart';

import '../../../constant/theme.dart';

class TravelerReview extends StatefulWidget {
  const TravelerReview({Key key}) : super(key: key);

  @override
  _TravelerReviewState createState() => _TravelerReviewState();
}

class _TravelerReviewState extends State<TravelerReview> {
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
                      labelColor: Color(ThemeColors.deepNavy),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      unselectedLabelColor: ThemeColors.gray1,
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 4, color: Color(ThemeColors.deepNavy)))),
                ),
                preferredSize: Size.fromHeight(0.0),
              )),
          body: TabBarView(children: [
            TravelerReviewDetail(),
            TravelerReviewWrite(),
          ]),
        ));
  }
}
