import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const deepNavy = 0xff3B7097;
const navy = 0xff4A8DB7;
const sky = 0x75BDE0;
const lightSky = 0xffA2E2F0;

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