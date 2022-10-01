import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constant/theme.dart';
import '../../../../models/review.dart';

class ReviewBody extends StatefulWidget {
  final ReviewInfo reviewInfo;

  const ReviewBody({Key key, this.reviewInfo}) : super(key: key);

  @override
  _ReviewBodyState createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
        ),
      ),
      child: Column(
        children: [
          _buildTop(widget.reviewInfo.place, widget.reviewInfo.date),
          _buildWriter(widget.reviewInfo.name, widget.reviewInfo.profileImg,
              widget.reviewInfo.grade),
          _buildImage(widget.reviewInfo.contentImg),
          _buildWriting(widget.reviewInfo.comment),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          _buildTail(widget.reviewInfo.commentCount)
        ],
      ),
    );
  }
}

Padding _buildTop(String place, DateTime date) {
  String formatDate = DateFormat('yyyy년 MM월 dd일 hh:mm').format(date);

  return Padding(
    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$place',style: textTheme().headline1,),
        Text(
          '$formatDate',
          style: TextStyle(fontSize:14,color: Colors.grey[500]),
        )
      ],
    ),
  );
}

Padding _buildWriter(String name, String img, int grade) {
  return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Image.asset('$img'),
            ),
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
                      color: Color(ThemeColors.deepNavy), size: 25),
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
                          color: Color(ThemeColors.deepNavy), size: 25),
                      Icon(Icons.star_rounded,
                          color: Color(ThemeColors.deepNavy), size: 25),
                      Icon(Icons.star_border_rounded, size: 25),
                      Icon(Icons.star_border_rounded, size: 25),
                      Icon(Icons.star_border_rounded, size: 25)
                    ],
                  )
                : grade == 3
                    ? Row(
                        children: [
                          Icon(Icons.star_rounded,
                              color: Color(ThemeColors.deepNavy), size: 25),
                          Icon(Icons.star_rounded,
                              color: Color(ThemeColors.deepNavy), size: 25),
                          Icon(Icons.star_rounded,
                              color: Color(ThemeColors.deepNavy), size: 25),
                          Icon(Icons.star_border_rounded, size: 25),
                          Icon(Icons.star_border_rounded, size: 25)
                        ],
                      )
                    : grade == 4
                        ? Row(
                            children: [
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_border_rounded, size: 25)
                            ],
                          )
                        : Row(
                            children: [
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25),
                              Icon(Icons.star_rounded,
                                  color: Color(ThemeColors.deepNavy), size: 25)
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

Visibility _buildImage(String contentImg) {
  return Visibility(
    visible: contentImg != '',
    child: Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Image.asset(
        '$contentImg',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Padding _buildTail(int commentCount) {
  return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            Icons.tag_faces_outlined,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            '공감하기',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(
            width: 22,
          ),
          Icon(
            Icons.mode_comment_outlined,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            '${"댓글쓰기"} $commentCount',
            style: TextStyle(fontSize: 16, color: Colors.black),
          )
        ],
      ));
}
