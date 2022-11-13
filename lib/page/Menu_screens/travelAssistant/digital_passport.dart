import 'package:flutter/material.dart';

class DigitalPassport extends StatefulWidget {
  DigitalPassport({Key key, this.themeColor}) : super(key: key);

  int themeColor;

  @override
  _DigitalPassportState createState() => _DigitalPassportState();
}

class _DigitalPassportState extends State<DigitalPassport> {

  @override
  void initState() {
    if(widget.themeColor==null){
      widget.themeColor=0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
