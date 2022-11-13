import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';

class InquiryBody extends StatefulWidget {
  final Map<String, dynamic> inquiryInfo;
  int themeColor;

  InquiryBody({Key key,this.themeColor, this.inquiryInfo}) : super(key: key);


  @override
  _InquiryBodyState createState() => _InquiryBodyState();
}

class _InquiryBodyState extends State<InquiryBody> {
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
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        color: Colors.white,
        width: width * 0.9,
        height: height * 0.47,
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '제목',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.black,
                  ),
                ),
                SizedBox(width: width * 0.1,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: width*0.6,
                  height: height*0.048,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: ThemeColors.gray1,width: 2)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(widget.inquiryInfo['gi_title'], style: TextStyle(
                            color: widget.themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : widget.themeColor == 1
                                ? ThemeColors.deepGreen
                                : ThemeColors.deepOrange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '문의내용',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.230,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ThemeColors.gray1,width: 2)
                    ),
                    child: Text(widget.inquiryInfo['gi_contents'],
                      style: TextStyle(color: widget.themeColor == 0
                          ? Color(ThemeColors.deepNavy)
                          : widget.themeColor == 1
                          ? ThemeColors.deepGreen
                          : ThemeColors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),)),
              ],
            ),
          ),
        ));
  }
}
