import 'package:flutter/material.dart';

const double kBorderRadius = 5;
const kPrimaryColor = Color(0xff3F7BFF);
const kBackgroundColor = Color(0xFFF2F2F2);
const kSecondColor = Color(0xff082E53);
const kAccentColor = Color(0xffFBC108);
const kDividerColor = Color(0xFFBDBDBD);
const kGrey = Color(0xffE8E8E8);
const kPlaceHolder = Color(0xff8D8D8D);
const kInputBackGround = Color(0xffF2F2F2);
const kBoldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
const double kDesktopPadding = 24;
const kTokenKey = 'token';
const kShimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
