import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/constants.dart';
import 'package:mgl_app/screens/profile_screen.dart';

import 'cali_screen.dart';
import 'exam_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _screens = const [
    HomeScreen(),
    CaliScreen(),
    ExamScreen(),
    ProfileScreen(),
  ];
  final _bnItem = const [
    //  TODO : Add the bottom navigation items here
    // BottomNavigationBarItem(
    //     icon: SizedBox(
    //       height: 24.0,
    //       width: 24.0,
    //       child: SvgPicture.asset(
    //         'assets/svgs/pen-solid.svg',
    //         color: Colors.red,
    //       ),
    //     ),
    //     label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.play_lesson), label: ''),

    BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
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
        child: Container(
          height: 100.0,
          color: Colors.red,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.abc),
                Icon(Icons.abc),
                Icon(Icons.abc),
              ]),
        ),
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
        items: _bnItem,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
