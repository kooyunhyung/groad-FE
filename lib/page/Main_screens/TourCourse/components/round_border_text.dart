import 'package:flutter/material.dart';
import 'package:gload_app/constant/theme.dart';

class RoundBorderText extends StatefulWidget {
  const RoundBorderText({Key? key, required this.title, required this.position})
      : super(key: key);

  final String title;
  final int position;

  @override
  _RoundBorderTextState createState() => _RoundBorderTextState();
}

class _RoundBorderTextState extends State<RoundBorderText> {
  String color='deepNavy';
  String textColor='white';

  @override
  Widget build(BuildContext context) {
    var paddingValue = widget.position == 0 ? 16.0 : 8.0;
    return GestureDetector(
      onTap: (){
        setState(() {

        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: paddingValue),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
