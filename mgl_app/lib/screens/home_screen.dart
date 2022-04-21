import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgl_app/screens/video_player.dart';
import 'package:firebase_core/firebase_core.dart';

import 'lesson_detail_screen.dart';
//import 'package:mgl_app/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> lessons =
      FirebaseFirestore.instance.collection('Lesson').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<QuerySnapshot>(
        stream: lessons,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          final data = snapshot.requireData;

          //Irsen secondoo minut ruu hurwvvleh
          String formatedTime(int secTime) {
            String getParsedTime(String time) {
              if (time.length <= 1) return "0$time";
              return time;
            }

            int min = secTime ~/ 60;
            int sec = secTime % 60;

            String parsedTime = getParsedTime(min.toString()) +
                " : " +
                getParsedTime(sec.toString());

            return parsedTime;
          }

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YoutubeVideo(),
                    ),
                  );
                }),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5),
                  ),
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
                  height: 80,
                  child: Row(
                    children: [
                      Text(
                        '${data.docs[index]['number']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/svgs/circle-play-solid 8.svg',
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                '${data.docs[index]['name']}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                height: 80.0,
                                width: 40.0,
                                child: Center(
                                    child: Text(
                                  '${formatedTime(data.docs[index]['time'])}',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                  ),
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
