import 'package:flutter/material.dart';

import '../../../api/user_api.dart';
import 'components/travel_info_body.dart';

class LocalCourse extends StatefulWidget {
  LocalCourse({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  State<LocalCourse> createState() => _LocalCourseState();
}

class _LocalCourseState extends State<LocalCourse> {
  dynamic travelInfoList;

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
                    1,
                        (index) => TravelInfoBody(
                        themeColor: widget.themeColor,
                        courseInfo: snapshot.data[index + 8]))
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
