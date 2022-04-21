// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'custom_theme_data.dart';
import 'screens/auth/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.primary,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
