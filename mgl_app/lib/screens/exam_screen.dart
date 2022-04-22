// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import 'exams.dart';
import 'video_player.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.64,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamsScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(229, 229, 229, 0.5),
              ),
              height: 160,
              child: const Center(
                child: Text(
                  'Сонгох шалгалт',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          );
        });
  }
}
