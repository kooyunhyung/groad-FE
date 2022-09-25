import 'package:flutter/material.dart';
import '../../constant/theme.dart';

class ErrorDialog extends AlertDialog {
  static Future<void> show(
      BuildContext context, {
        String message,
        bool hideCancel = false,
      }) async {
    return await showDialog(
        context: context,
        builder: (context) =>
            ErrorDialog(context, message: message, hideCancel: hideCancel));
  }

  ErrorDialog(
      BuildContext context, {
        String message,
        bool hideCancel = false,
      }) : super(
    content: Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(9.73)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!hideCancel)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: Feedback.wrapForTap(() {
                    Navigator.pop(context);
                  }, context),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ThemeColors.gray1),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: ThemeColors.gray1,
                    ),
                  ),
                )
              ],
            ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 53, bottom: 25),
            child: Row(
              children: [
                Text(message,
                    style: TextStyle(
                        color: ThemeColors.gray1,
                        fontSize: 15,
                        height: 23 / 15)),
              ],
            ),
          ),
        ],
      ),
    ),
    insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
    contentPadding: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
