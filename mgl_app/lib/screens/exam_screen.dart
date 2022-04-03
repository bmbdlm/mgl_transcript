import 'package:flutter/material.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(229, 229, 229, 0.5),
              ),
              height: 80,
              child: const Center(child: Text('Сонгох шалгалт')));
        });
  }
}
