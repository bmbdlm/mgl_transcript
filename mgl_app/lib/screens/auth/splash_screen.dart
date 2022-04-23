import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mgl_app/constants.dart';
import 'package:mgl_app/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: const Center(
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              'ᠠᠫᠫᠯᠢᠭ ᠢᠶᠢᠰᠢᠨ ᠤ ᠨᠡᠷ᠎ᠡ',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
