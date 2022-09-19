import 'package:flutter/material.dart';

class Benefits extends StatelessWidget {
  const Benefits({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Center(
        child: Text(
          'BenefitsPage',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
