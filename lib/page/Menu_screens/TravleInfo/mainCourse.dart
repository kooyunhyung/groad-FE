import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'components/travel_info_body.dart';

class MainCourse extends StatefulWidget {
  MainCourse({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  State<MainCourse> createState() => _MainCourseState();
}

class _MainCourseState extends State<MainCourse> {
  dynamic travelInfoList;

  @override
  void initState() {
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchTravelInfo(),
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
                    3,
                    (index) =>TravelInfoBody(
                        themeColor: widget.themeColor,
                        courseInfo: snapshot.data[index]))
              ],
            );
          }
        });
  }

  Future<dynamic> _fetchTravelInfo() async {
    travelInfoList = await UserAPI(context: context).getTravelCourse();
    return travelInfoList;
  }
}
