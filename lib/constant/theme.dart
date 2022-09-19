import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const deepNavy = 0xff3B7097;
const navy = 0xff4A8DB7;
const sky = 0x75BDE0;
const lightSky = 0xffA2E2F0;
const white = const Color(0XFFFFFFFF);
const black = const Color(0XFF000000);
const primary = const Color(0XFF6C40EE);
const darkPurple = const Color(0xFF5430BE);
const transparent = const Color(0X00000000);
const gray1 = const Color(0XFFD5D5D5);
const gray2 = const Color(0XFF949494);
const gray3 = const Color(0XFF9C9C9C);
const red = const Color(0XFFFF3C52);
const pink = const Color(0XFFFFA7A7);
const green = const Color(0XFF12575A);
const green2 = const Color(0XFF006A52);
const yellow = const Color(0XFFFF9A04);
const blue = const Color(0XFF3873FE);
const skyBlue = const Color(0xFF7598FF);

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.ibmPlexSans(fontSize: 18.0, color: Color(deepNavy), fontWeight: FontWeight.bold),
    headline2: GoogleFonts.ibmPlexSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.ibmPlexSans(fontSize: 16.0, color: Color(deepNavy)),
    bodyText2: GoogleFonts.ibmPlexSans(fontSize: 14.0, color: Color(deepNavy)),
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
        color: Color(deepNavy)
      )
    )
  );
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
        color: Color(deepNavy)
      )
    )
  );
}
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
  );
}