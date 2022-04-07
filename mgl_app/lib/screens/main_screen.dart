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
        // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
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
        child: Container(
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
                      const Text('3 өдөр',
                          style: const TextStyle(
                              color: const Color(0xffEF7400),
                              fontFamily: 'Nunito',
                              fontSize: 18.0)),
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
                      const Text('3',
                          style: TextStyle(
                              color: Color(0xFFEF476F),
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
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
                      const Text(
                        '3789',
                        style: const TextStyle(
                            color: Color(0xFFFFB51A),
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ]),
          ),
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
        items: _bnItem(_currentIndex),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
