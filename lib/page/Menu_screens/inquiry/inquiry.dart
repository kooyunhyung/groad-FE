import 'package:flutter/material.dart';

import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Menu_screens/inquiry/my_inquiry_history.dart';
import 'package:gload_app/page/Menu_screens/inquiry/ono_to_one_inquiry.dart';

class Inquiry extends StatefulWidget {
  const Inquiry({Key key}) : super(key: key);

  @override
  State<Inquiry> createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<String> categories = ['1:1 문의하기', '나의 문의 내역'];

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
            OneToOneInquiry(),
            MyInquiryHistory(),
          ]),
        ));
  }
}
