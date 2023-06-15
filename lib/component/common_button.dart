import 'package:flutter/material.dart';

import '../constant/theme.dart';

class CommonButton extends StatelessWidget {
  final int themeColor;
  final String label;
  final Border border;
  final Color activeColor;
  final Color inactiveColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextStyle labelStyle;
  final double width;
  final double height;
  final void Function() onPress;
  final double radius;
  final List<BoxShadow> shadow;
  final bool full;
  final MainAxisAlignment alignment;

  CommonButton({
    this.themeColor=0,
    this.label = '',
    this.border = const Border(),
    this.labelStyle = const TextStyle(
      fontSize: 28,
      height: 21 / 18,
      color: ThemeColors.white,
    ),
    this.activeColor = const Color(0xff3B7097),
    this.inactiveColor = ThemeColors.gray3,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onPress,
    this.radius = 8,
    this.shadow = const [BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 8,
      color: Color(0x75BDE0),
    ),],
    this.full = false,
    this.alignment = MainAxisAlignment.center,
  });

  Widget _button(BuildContext context) {
    return GestureDetector(
      onTap: onPress != null
          ? Feedback.wrapForTap(() {
        onPress();
      }, context)
          : null,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 82,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(radius),
          color: themeColor == 0
              ? Color(ThemeColors.deepNavy)
              : themeColor == 1
              ? ThemeColors.deepGreen
              : ThemeColors.deepOrange,
          boxShadow: shadow,
        ),
        child: Text(label,
            style: onPress != null
                ? labelStyle
                : labelStyle.apply(color: ThemeColors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (full) return _button(context);
    return Row(
      mainAxisAlignment: alignment,
      children: [_button(context)],
    );
  }
}
