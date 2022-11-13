import 'package:flutter/material.dart';
import '../../../api/user_api.dart';
import 'components/inquiry_body.dart';

class MyInquiryHistory extends StatefulWidget {
  MyInquiryHistory({Key key,this.themeColor}) : super(key: key);

  int themeColor;

  @override
  State<MyInquiryHistory> createState() => _MyInquiryHistoryState();
}

class _MyInquiryHistoryState extends State<MyInquiryHistory> {
  dynamic myInquiryList;

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
    return FutureBuilder(
        future: _fetchInquiryInfo(),
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
                      child: InquiryBody(themeColor:widget.themeColor,inquiryInfo: snapshot.data[index]),
                    ))
              ],
            );
          }
        });
  }
  Future<dynamic> _fetchInquiryInfo() async {
    myInquiryList = await UserAPI(context: context).getInquiryDetail(fk: 2);
    print(myInquiryList);
    return myInquiryList;
  }
}
