import 'package:flutter/material.dart';
import '../../constant/theme.dart';

class NotifyDialog extends AlertDialog {

  static Future<bool> show(
      BuildContext context, {
        String message,
        EdgeInsets padding,
        TextStyle style,
        TextSpan spanText,
        double radius,
      }) async {
    return await showDialog(
        context: context,
        builder: (context) => NotifyDialog(
          context,
          message: message,
          spanText: spanText,
          padding: padding,
          style: style,
          radius: radius,
        )) ??
        true;
  }

  NotifyDialog(
      BuildContext context, {
        String message,
        EdgeInsets padding,
        TextStyle style,
        TextSpan spanText,
        double radius,
      }) : super(
    content: FittedBox(
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.fromLTRB(49, 23, 49, 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: ThemeColors.white,
        ),
        child: message != null
            ? Text(
          message,
          style: style ??
              TextStyle(
                fontSize: 18,
                color: ThemeColors.black,
                height: 23 / 18,
              ),
          textAlign: TextAlign.center,
        )
            : spanText,
      ),
    ),
    contentPadding: EdgeInsets.zero,
    insetPadding: EdgeInsets.symmetric(horizontal: 48),
  );
}
