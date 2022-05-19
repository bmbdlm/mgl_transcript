// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/constants.dart';
import 'package:mgl_app/screens/profile_screen.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'package:mgl_app/data/database.dart';

import '../data/user.dart';
import 'cali_screen.dart';
import 'exam_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  final user = globals.auth.currentUser;
  int health = globals.global_user.health;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int _counter = 900;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          globals.global_user.health += 1;
          _timer.cancel();
        }
      });
    });
  }

  String formatTime(int secondz) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secondz ~/ 60;
    int sec = secondz % 60;

    String parsedTime =
        getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

    return parsedTime;
  }

  @override
  void initState() {
    globals.lifeChangeStream.stream.listen((event) {
      print(event.abs());
      _startTimer();
      // if (_counter == 0) {
      //   _counter = 900;
      //   _startTimer();
      // } else {
      //   _counter = _counter + 900;
      // }
    });
    super.initState();
  }

  final _screens = [
    HomeScreen(),
    CaliScreen(),
    ExamScreen(),
    ProfileScreen(),
    ExamScreen(),
  ];
  List<BottomNavigationBarItem> _bnItem(currentIndex) => [
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 35.0,
              width: 35.0,
              child: SvgPicture.asset(
                'assets/svgs/Vector.svg',
                color: currentIndex == 0 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 35.0,
              width: 35.0,
              child: SvgPicture.asset(
                'assets/svgs/pen_ruler.svg',
                color: currentIndex == 1 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 35.0,
              width: 35.0,
              child: SvgPicture.asset(
                'assets/svgs/Vector-4.svg',
                color: currentIndex == 2 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 35.0,
              width: 35.0,
              child: SvgPicture.asset(
                'assets/svgs/user.svg',
                color: currentIndex == 3 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),
      ];
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100.0),
        child: FutureBuilder<MyUser?>(
            future: DatabaseService().getData(),
            builder: (context, snapshot) {
              return Container(
                height: 85.0,
                color: const Color(0xFFE0E0E0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 28.0,
                              width: 28.0,
                              child: SvgPicture.asset(
                                'assets/svgs/fire-solid 1.svg',
                                color: const Color(0xffEF7400),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text('${snapshot.data?.daysStreak} өдөр',
                                style: const TextStyle(
                                    color: const Color(0xffEF7400),
                                    fontFamily: 'Nunito',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 28.0,
                              width: 28.0,
                              child: SvgPicture.asset(
                                'assets/svgs/heart-solid 1.svg',
                                color: const Color(0xFFEF476F),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text('${globals.global_user.health}',
                                style: TextStyle(
                                    color: Color(0xFFEF476F),
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.0)),
                            const SizedBox(width: 8.0),
                            Text('(${formatTime(_counter)})',
                                style: TextStyle(
                                    color: Color(0xFFEF476F),
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.0)),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 28.0,
                              width: 28.0,
                              child: SvgPicture.asset(
                                'assets/svgs/coins-solid 1.svg',
                                color: const Color(0xFFFFB51A),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              '${snapshot.data?.exp}',
                              style: const TextStyle(
                                color: Color(0xFFFFB51A),
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              );
            }),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => changeIndex(value),
        backgroundColor: const Color(0xFFE0E0E0),
        unselectedItemColor: Colors.grey,
        selectedItemColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 50,
        items: _bnItem(_currentIndex),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
