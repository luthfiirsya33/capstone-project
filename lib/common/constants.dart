import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF086972);
const Color whiteColor70 = Color(0xB3FFFFFF);
const Color whiteColor = Color(0xFFFFFFFF);
const Color greenColor = Color(0xFF17B978);
const Color lightGreenColor = Color(0xFFA7FF83);
const Color darkGreenColor = Color(0xFF086972);
const Color darkPurpleColor = Color(0xFF071A52);
const Color blackColor = Color(0xFF000000);
const Color greyColor = Color(0xFF9698A9);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);
TextStyle white70TextyStyle = GoogleFonts.poppins(
  color: whiteColor70,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenColor,
);
TextStyle lightGreenTextStyle = GoogleFonts.poppins(
  color: lightGreenColor,
);
TextStyle darkGreenTextStyle = GoogleFonts.poppins(
  color: darkGreenColor,
);
TextStyle darkPurpleTextStyle = GoogleFonts.poppins(
  color: darkPurpleColor,
);
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);

FontWeight light = FontWeight.w100;
FontWeight regular = FontWeight.w300;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w900;

// text style
final TextStyle kHeading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle kHeading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle kSubtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);
