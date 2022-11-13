import 'package:flutter/material.dart';

import '../../../constant/theme.dart';
import 'digital_passport.dart';
import 'terms_of_use.dart';
import 'travel_material.dart';


class TravelAssistant extends StatefulWidget {
  TravelAssistant({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  _TravelAssistantState createState() => _TravelAssistantState();
}

class _TravelAssistantState extends State<TravelAssistant> {

  @override
  void initState() {
    if(widget.themeColor==null){
      widget.themeColor=0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width =      MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<String> categories = ['이용수칙', '준비물', '패스포트'];

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
                      isScrollable: true,
                      labelColor: widget.themeColor == 0
                          ? Color(ThemeColors.deepNavy)
                          : widget.themeColor == 1
                          ? ThemeColors.deepGreen
                          : ThemeColors.deepOrange,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      unselectedLabelColor: ThemeColors.gray1,
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
            TermsOfUse(themeColor:widget.themeColor),
            TravelMaterial(themeColor: widget.themeColor,),
            DigitalPassport(themeColor: widget.themeColor),
          ]),
        ));
  }
}
