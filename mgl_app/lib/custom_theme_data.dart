import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTheme {
  static final primary = ThemeData().copyWith(
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(kPrimaryColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(kPrimaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    appBarTheme: const AppBarTheme().copyWith(
      // color: primaryColor,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.blue),
    ),
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
    primaryTextTheme: ThemeData().primaryTextTheme.apply(
          bodyColor: const Color(0xFF212121),
          displayColor: const Color(0xFF212121),
        ),
    dividerColor: kDividerColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: kPrimaryColor),
      ),
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        primary: kPrimaryColor, // background color
        textStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
    ),
    // outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(15),
      ),
    ),
  );
  static final light = ThemeData.light().copyWith(
    primaryColor: const Color(0xFFD32F2F),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
  );
  static final dark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xFFFFCDD2),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
  );
}
