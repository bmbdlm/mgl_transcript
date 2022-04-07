import 'package:flutter/material.dart';

import 'custom_theme_data.dart';
//import 'screens/auth/login_screen.dart';
import 'screens/auth/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.primary,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
