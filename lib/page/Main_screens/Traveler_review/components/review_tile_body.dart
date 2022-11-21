import 'package:flutter/material.dart';

import '../../../../constant/theme.dart';
import '../../../frame/common_frame2.dart';
import '../traveler_review.dart';

class ReviewTileBody extends StatefulWidget {
  ReviewTileBody(
      {Key key, this.idKey,this.mapType, this.themeColor, this.userInfo, this.reviewInfo})
      : super(key: key);

  int idKey;
  int mapType;
  int themeColor;
  dynamic userInfo;
  dynamic reviewInfo;

  @override
  _ReviewTileBodyState createState() => _ReviewTileBodyState();
}

class _ReviewTileBodyState extends State<ReviewTileBody> {
  dynamic reviewInfo;
  String contentImage;
  String name;
  String title;
  String contentText;
  int grade;

  @override
  void initState() {
    if(widget.mapType==null){
      widget.mapType=0;
    }
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    reviewInfo = widget.reviewInfo;
    contentImage = reviewInfo['gr_content_image'];
    name = reviewInfo['gr_name'];
    title = reviewInfo['gr_place'];
    contentText = reviewInfo['gr_content_text'];
    grade = reviewInfo['gr_grade'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CommonFrame2(
                  themeColor: widget.themeColor,
                  title: '여행자들의 후기',
                  clas: TravelerReview(
                    userInfo: widget.userInfo,
                    idKey: widget.idKey,
                    mapType: widget.mapType,
                    themeColor: widget.themeColor,
                  ))),
        );
      },
      child: Card(
        child: Container(
          width: width * 0.6326,
          height: height * 0.30075,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          width: width * 0.6326,
                          height: height * 0.24,
                          child: Image.network(
                            contentImage,
                            fit: BoxFit.fill,
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.16),
                    child: Container(
                      width: width * 0.6326,
                      height: height * 0.175,
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: width * 0.036496,
                          right: width * 0.036496,
                          top: height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 20),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                child: grade == 1
                                    ? Row(
                                        children: [
                                          Icon(Icons.star_rounded,
                                              color: widget.themeColor == 0
                                                  ? Color(ThemeColors.deepNavy)
                                                  : widget.themeColor == 1
                                                      ? ThemeColors.deepGreen
                                                      : ThemeColors.deepOrange,
                                              size: 17),
                                          Icon(Icons.star_border_rounded,
                                              size: 17),
                                          Icon(Icons.star_border_rounded,
                                              size: 17),
                                          Icon(Icons.star_border_rounded,
                                              size: 17),
                                          Icon(Icons.star_border_rounded,
                                              size: 17)
                                        ],
                                      )
                                    : grade == 2
                                        ? Row(
                                            children: [
                                              Icon(Icons.star_rounded,
                                                  color: widget.themeColor == 0
                                                      ? Color(
                                                          ThemeColors.deepNavy)
                                                      : widget.themeColor == 1
                                                          ? ThemeColors
                                                              .deepGreen
                                                          : ThemeColors
                                                              .deepOrange,
                                                  size: 17),
                                              Icon(Icons.star_rounded,
                                                  color: widget.themeColor == 0
                                                      ? Color(
                                                          ThemeColors.deepNavy)
                                                      : widget.themeColor == 1
                                                          ? ThemeColors
                                                              .deepGreen
                                                          : ThemeColors
                                                              .deepOrange,
                                                  size: 17),
                                              Icon(Icons.star_border_rounded,
                                                  size: 17),
                                              Icon(Icons.star_border_rounded,
                                                  size: 17),
                                              Icon(Icons.star_border_rounded,
                                                  size: 17)
                                            ],
                                          )
                                        : grade == 3
                                            ? Row(
                                                children: [
                                                  Icon(Icons.star_rounded,
                                                      color: widget
                                                                  .themeColor ==
                                                              0
                                                          ? Color(ThemeColors
                                                              .deepNavy)
                                                          : widget.themeColor ==
                                                                  1
                                                              ? ThemeColors
                                                                  .deepGreen
                                                              : ThemeColors
                                                                  .deepOrange,
                                                      size: 17),
                                                  Icon(Icons.star_rounded,
                                                      color: widget
                                                                  .themeColor ==
                                                              0
                                                          ? Color(ThemeColors
                                                              .deepNavy)
                                                          : widget.themeColor ==
                                                                  1
                                                              ? ThemeColors
                                                                  .deepGreen
                                                              : ThemeColors
                                                                  .deepOrange,
                                                      size: 17),
                                                  Icon(Icons.star_rounded,
                                                      color: widget
                                                                  .themeColor ==
                                                              0
                                                          ? Color(ThemeColors
                                                              .deepNavy)
                                                          : widget.themeColor ==
                                                                  1
                                                              ? ThemeColors
                                                                  .deepGreen
                                                              : ThemeColors
                                                                  .deepOrange,
                                                      size: 17),
                                                  Icon(
                                                      Icons.star_border_rounded,
                                                      size: 17),
                                                  Icon(
                                                      Icons.star_border_rounded,
                                                      size: 17)
                                                ],
                                              )
                                            : grade == 4
                                                ? Row(
                                                    children: [
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(
                                                          Icons
                                                              .star_border_rounded,
                                                          size: 17)
                                                    ],
                                                  )
                                                : Row(
                                                    children: [
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17),
                                                      Icon(Icons.star_rounded,
                                                          color: widget
                                                                      .themeColor ==
                                                                  0
                                                              ? Color(
                                                                  ThemeColors
                                                                      .deepNavy)
                                                              : widget.themeColor ==
                                                                      1
                                                                  ? ThemeColors
                                                                      .deepGreen
                                                                  : ThemeColors
                                                                      .deepOrange,
                                                          size: 17)
                                                    ],
                                                  ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.0057,
                          ),
                          Row(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.001165,
                          ),
                          Text(
                            contentText,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02433, top: height * 0.12698),
                      child: reviewInfo['gr_profile_image'] == null ||
                              reviewInfo['gr_profile_image'] == 'None' ||
                              reviewInfo['gr_profile_image'] == ''
                          ? Icon(
                              Icons.account_circle_sharp,
                              size: 40,
                            )
                          : CircleAvatar(
                              backgroundColor: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(reviewInfo['gr_profile_image']),
                            )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
