import 'package:flutter/material.dart';
import 'package:gload_app/models/review.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/components/review_body.dart';

class TravelerReviewDetail extends StatefulWidget {
  const TravelerReviewDetail({Key key}) : super(key: key);

  @override
  _TravelerReviewDetailState createState() => _TravelerReviewDetailState();
}

class _TravelerReviewDetailState extends State<TravelerReviewDetail> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
            ReviewInfoList.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ReviewBody(reviewInfo: ReviewInfoList[index]),
                ))
      ],
    );
  }
}
