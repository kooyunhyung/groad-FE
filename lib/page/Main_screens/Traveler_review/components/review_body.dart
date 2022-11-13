import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/page/Main_screens/TravelCourse/PositionPage/full_screen_page.dart';
import 'package:intl/intl.dart';

import '../../../../api/user_api.dart';
import '../../../../component/dialog/notify_dialog.dart';
import '../../../../constant/theme.dart';

class ReviewBody extends StatefulWidget {
  final Map<String, dynamic> reviewInfo;
  final Map<String, dynamic> userInfo;
  int themeColor;
  int idKey;

  ReviewBody(
      {Key key, this.idKey, this.userInfo, this.reviewInfo, this.themeColor})
      : super(key: key);

  @override
  _ReviewBodyState createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  DateTime date;
  dynamic commentList;

  TextEditingController _comment = TextEditingController();

  @override
  void initState() {
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    date = DateTime.parse(widget.reviewInfo['gr_date']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
        ),
      ),
      child: Column(
        children: [
          _buildTop(widget.reviewInfo['gr_place'], date, widget.themeColor),
          _buildWriter(widget.reviewInfo['gr_name'], widget.reviewInfo['gr_profile_image'],
              widget.reviewInfo['gr_grade'], widget.themeColor),
          _buildImage(widget.reviewInfo['gr_content_image'], context),
          _buildWriting(widget.reviewInfo['gr_content_text']),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          FutureBuilder(
              future: _fetchCommentInfo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Center(
                      child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      ...List.generate(
                          snapshot.data.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 4, left: 5, right: 5),
                                child: Container(
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          snapshot.data[index][
                                                          'grc_profile_image'] ==
                                                      null ||
                                                  snapshot.data[index][
                                                          'grc_profile_image'] ==
                                                      'None' ||
                                                  snapshot.data[index][
                                                          'grc_profile_image'] ==
                                                      ''
                                              ? Icon(
                                                  Icons.account_circle_sharp,
                                                  size: 40,
                                                )
                                              : CircleAvatar(
                                                  backgroundColor: widget
                                                              .themeColor ==
                                                          0
                                                      ? Color(
                                                          ThemeColors.deepNavy)
                                                      : widget.themeColor == 1
                                                          ? ThemeColors
                                                              .deepGreen
                                                          : ThemeColors
                                                              .deepOrange,
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                    snapshot.data[index]
                                                        ['grc_profile_image'],
                                                  ),
                                                ),
                                          SizedBox(
                                            width: width * 0.03,
                                          ),
                                          Text(
                                            snapshot.data[index]['grc_name'],
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 8.5),
                                        width: width * 0.7,
                                        child: Text(snapshot.data[index]
                                            ['grc_comment']),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: ThemeColors.gray1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 280,
                              child: TextField(
                                controller: _comment,
                                keyboardType: TextInputType.text,
                                maxLength: 200,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: '',
                                    hintText: '댓글을 입력하세요..'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (widget.idKey == -1) {
                                  NotifyDialog.show(context,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: ThemeColors.black,
                                          height: 23 / 18),
                                      message: '로그인 후 이용 가능합니다.');
                                  return;
                                }
                                if (_comment.text == '' ||
                                    _comment.text == null) {
                                  NotifyDialog.show(context,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: ThemeColors.black,
                                          height: 23 / 18),
                                      message: '댓글 내용을 입력하십시오.');
                                } else {
                                  final response =
                                      await UserAPI(context: context)
                                          .createReviewComment(
                                              name: widget.userInfo['gu_name'],
                                              profileImage: widget
                                                  .userInfo['gu_profile_image'],
                                              commentText: _comment.text,
                                              fk: widget.reviewInfo['gr_seq']);
                                  print(response);
                                  setState(() {
                                    _comment.text = '';
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: widget.themeColor == 0
                                      ? Color(ThemeColors.deepNavy)
                                      : widget.themeColor == 1
                                          ? ThemeColors.deepGreen
                                          : ThemeColors.deepOrange,
                                ),
                                width: 97,
                                height: 55,
                                child: Center(
                                    child: Text(
                                  '등록',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
              })
        ],
      ),
    );
  }

  Padding _buildTop(String place, DateTime date, int themeColor) {
    String formatDate = DateFormat('yyyy년 MM월 dd일 HH:mm').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$place',
            style: themeColor == 0
                ? textTheme().headline1
                : themeColor == 1
                    ? textTheme().headline2
                    : textTheme().headline3,
          ),
          Text(
            '$formatDate',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          )
        ],
      ),
    );
  }

  Padding _buildWriter(String name, String img, int grade, int themeColor) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: img == null || img == "None" || img == ''
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
                        radius: 40,
                        backgroundImage: NetworkImage(
                          img,
                        ),
                      ),
              ),
              SizedBox(width: 10,),
              Text(
                '$name',
                style: textTheme().bodyText1,
              )
            ],
          ),
          grade == 1
              ? Row(
                  children: [
                    Icon(Icons.star_rounded,
                        color: themeColor == 0
                            ? Color(ThemeColors.deepNavy)
                            : themeColor == 1
                                ? ThemeColors.deepGreen
                                : ThemeColors.deepOrange,
                        size: 25),
                    Icon(Icons.star_border_rounded, size: 25),
                    Icon(Icons.star_border_rounded, size: 25),
                    Icon(Icons.star_border_rounded, size: 25),
                    Icon(Icons.star_border_rounded, size: 25)
                  ],
                )
              : grade == 2
                  ? Row(
                      children: [
                        Icon(Icons.star_rounded,
                            color: themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 25),
                        Icon(Icons.star_rounded,
                            color: themeColor == 0
                                ? Color(ThemeColors.deepNavy)
                                : themeColor == 1
                                    ? ThemeColors.deepGreen
                                    : ThemeColors.deepOrange,
                            size: 25),
                        Icon(Icons.star_border_rounded, size: 25),
                        Icon(Icons.star_border_rounded, size: 25),
                        Icon(Icons.star_border_rounded, size: 25)
                      ],
                    )
                  : grade == 3
                      ? Row(
                          children: [
                            Icon(Icons.star_rounded,
                                color: themeColor == 0
                                    ? Color(ThemeColors.deepNavy)
                                    : themeColor == 1
                                        ? ThemeColors.deepGreen
                                        : ThemeColors.deepOrange,
                                size: 25),
                            Icon(Icons.star_rounded,
                                color: themeColor == 0
                                    ? Color(ThemeColors.deepNavy)
                                    : themeColor == 1
                                        ? ThemeColors.deepGreen
                                        : ThemeColors.deepOrange,
                                size: 25),
                            Icon(Icons.star_rounded,
                                color: themeColor == 0
                                    ? Color(ThemeColors.deepNavy)
                                    : themeColor == 1
                                        ? ThemeColors.deepGreen
                                        : ThemeColors.deepOrange,
                                size: 25),
                            Icon(Icons.star_border_rounded, size: 25),
                            Icon(Icons.star_border_rounded, size: 25)
                          ],
                        )
                      : grade == 4
                          ? Row(
                              children: [
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_border_rounded, size: 25)
                              ],
                            )
                          : Row(
                              children: [
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25),
                                Icon(Icons.star_rounded,
                                    color: themeColor == 0
                                        ? Color(ThemeColors.deepNavy)
                                        : themeColor == 1
                                            ? ThemeColors.deepGreen
                                            : ThemeColors.deepOrange,
                                    size: 25)
                              ],
                            )
        ]));
  }

  Padding _buildWriting(String comment) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            comment,
            style: textTheme().bodyText2,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ));
  }

  Visibility _buildImage(String contentImg, BuildContext context) {
    return Visibility(
      visible: contentImg != '',
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  opaque: false,
                  barrierColor: Colors.black,
                  pageBuilder: (BuildContext context, _, __) {
                    return FullScreenPage(
                      image: Image.network(
                        contentImg,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    );
                  }));
        },
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Image.network(
            contentImg,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _fetchCommentInfo() async {
    commentList = await UserAPI(context: context)
        .getReviewComment(fk: widget.reviewInfo['gr_seq']);
    print(commentList);
    return commentList;
  }
}
