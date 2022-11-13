import 'package:flutter/material.dart';
import '../../constant/theme.dart';


class CommonFrame2 extends StatefulWidget {
  CommonFrame2({Key key, this.idKey, this.title, this.clas, this.themeColor})
      : super(key: key);

  int themeColor;
  int idKey;
  final Object clas;
  final String title;

  @override
  _CommonFrame2State createState() => _CommonFrame2State();
}

class _CommonFrame2State extends State<CommonFrame2> {
  @override
  void initState() {
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    super.initState();
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: widget.themeColor == 0
              ? Color(0xffA2E2F8)
              : widget.themeColor == 1
                  ? Color(0xFF90EE90)
                  : Color(0xFFFFD700),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: widget.themeColor == 0
                    ? Color(ThemeColors.deepNavy)
                    : widget.themeColor == 1
                        ? ThemeColors.deepGreen
                        : ThemeColors.deepOrange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.themeColor == 0
                    ? Color(ThemeColors.deepNavy)
                    : widget.themeColor == 1
                        ? ThemeColors.deepGreen
                        : ThemeColors.deepOrange),
          ),
        ),
      ),
      body: widget.clas,
    );
  }
}
