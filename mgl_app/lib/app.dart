import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data/globals.dart' as globals;

import 'custom_theme_data.dart';
//import 'screens/auth/login_screen.dart';
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
