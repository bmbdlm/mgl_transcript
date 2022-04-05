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
  List<BottomNavigationBarItem> _bnItem(currentIndex) => [
        //  TODO : Add the bottom navigation items here
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 24.0,
              width: 24.0,
              child: SvgPicture.asset(
                'assets/svgs/Vector.svg',
                color: currentIndex == 0 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),
        // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 24.0,
              width: 24.0,
              child: SvgPicture.asset(
                'assets/svgs/pen_ruler.svg',
                color: currentIndex == 1 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),

        BottomNavigationBarItem(
            icon: SizedBox(
              height: 24.0,
              width: 24.0,
              child: SvgPicture.asset(
                'assets/svgs/Vector-2.svg',
                color: currentIndex == 2 ? kPrimaryColor : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 24.0,
              width: 24.0,
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
          height: 100.0,
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
                        height: 24.0,
                        width: 24.0,
                        child: SvgPicture.asset(
                          'assets/svgs/fire-solid 1.svg',
                          color: const Color(0xffEF7400),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text('3 Өдөр',
                          style:
                              const TextStyle(color: const Color(0xffEF7400))),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: SvgPicture.asset(
                          'assets/svgs/heart-solid 1.svg',
                          color: const Color(0xFFEF476F),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text('3 Амь',
                          style: TextStyle(color: Color(0xFFEF476F))),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: SvgPicture.asset(
                          'assets/svgs/coins-solid 1.svg',
                          color: const Color(0xFFFFB51A),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text('3789',
                          style: const TextStyle(color: Color(0xFFFFB51A))),
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
