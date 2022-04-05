import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 16.0, right: 16.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(229, 229, 229, 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Бат  Дорж',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 9 / 6,
              children: [
                StatisticWidget(
                  text: 'Нийт суралцсан цаг',
                  svgPath: Icons.lock_clock,
                ),
                StatisticWidget(
                  text: 'Нийт цуглуулсан оноо',
                  svgPath: Icons.power_input,
                ),
                StatisticWidget(
                  text: 'Одоогийн түвшин',
                  svgPath: Icons.graphic_eq_outlined,
                ),
                StatisticWidget(
                  text: 'Нийт хичээлийнпроцесс',
                  svgPath: Icons.percent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StatisticWidget extends StatelessWidget {
  final String text;
  final IconData svgPath;

  const StatisticWidget({
    Key? key,
    required this.text,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 16.0, right: 16.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(229, 229, 229, 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(text),
          ),
          const SizedBox(width: 8.0),
          Icon(svgPath)
        ],
      ),
    );
  }
}
