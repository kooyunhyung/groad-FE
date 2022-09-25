import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeColors {
  static const deepNavy = 0xff3B7097;
  static const navy = 0xff4A8DB7;
  static const sky = 0x75BDE0;
  static const lightSky = 0xffA2E2F0;
  static const white = const Color(0XFFFFFFFF);
  static const black = const Color(0XFF000000);
  static const primary = const Color(0XFF6C40EE);
  static const darkPurple = const Color(0xFF5430BE);
  static const transparent = const Color(0X00000000);
  static const gray1 = const Color(0XFFD5D5D5);
  static const gray2 = const Color(0XFF949494);
  static const gray3 = const Color(0XFF9C9C9C);
  static const red = const Color(0XFFFF3C52);
  static const pink = const Color(0XFFFFA7A7);
  static const green = const Color(0XFF12575A);
  static const green2 = const Color(0XFF006A52);
  static const yellow = const Color(0XFFFF9A04);
  static const blue = const Color(0XFF3873FE);
  static const skyBlue = const Color(0xFF7598FF);
}

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
        fontSize: 18.0, color: Color(ThemeColors.deepNavy), fontWeight: FontWeight.bold),
    headline2: GoogleFonts.ibmPlexSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.ibmPlexSans(fontSize: 16.0, color: Color(ThemeColors.deepNavy)),
    bodyText2: GoogleFonts.ibmPlexSans(fontSize: 14.0, color: Color(ThemeColors.deepNavy)),
    subtitle1: GoogleFonts.ibmPlexSans(fontSize: 14.0, color: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      centerTitle: false,
      color: Color(0xffA2E2F8),
      elevation: 3.0,
      textTheme: TextTheme(
          headline6: GoogleFonts.nanumGothic(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(ThemeColors.deepNavy))));
}

AppBarTheme sideAppBarTheme() {
  return AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 3.0,
      textTheme: TextTheme(
          headline6: GoogleFonts.nanumGothic(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(ThemeColors.deepNavy))));
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
  );
}
