import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/page/Main_screens/Traveler_review/components/review_body.dart';

class TravelerReviewDetail extends StatefulWidget {
  TravelerReviewDetail({Key key, this.idKey, this.userInfo, this.themeColor}) : super(key: key);

  dynamic userInfo;
  int idKey;
  int themeColor;

  @override
  _TravelerReviewDetailState createState() => _TravelerReviewDetailState();
}

class _TravelerReviewDetailState extends State<TravelerReviewDetail> {
  dynamic reviewInfoList;
  dynamic userInfo;

  @override
  void initState() {
    if(widget.idKey==null){
      widget.idKey=-1;
      userInfo=null;
    }
    if(widget.themeColor==null){
      widget.themeColor=0;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchReviewInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Container(
                child: Center(
                    child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator())));
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
            return ListView(
              children: [
                ...List.generate(
                    snapshot.data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ReviewBody(idKey:widget.idKey, themeColor:widget.themeColor,userInfo: userInfo, reviewInfo: snapshot.data[snapshot.data.length-index-1]),
                        ))
              ],
            );
          }
        });
  }

  Future<dynamic> _fetchReviewInfo() async {
    if(widget.idKey!=-1){
      userInfo = await UserAPI(context: context).getUser(pk: widget.idKey);
    }
    reviewInfoList = await UserAPI(context: context).getReview();
    print(reviewInfoList);
    return reviewInfoList;
  }
}
