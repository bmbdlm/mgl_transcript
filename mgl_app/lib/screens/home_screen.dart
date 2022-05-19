// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgl_app/data/database.dart';
import 'package:mgl_app/screens/video_player.dart';
import 'package:mgl_app/data/globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> lessons = FirebaseFirestore.instance
      .collection('Lesson')
      .orderBy('number', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<QuerySnapshot>(
        stream: lessons,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
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
            reverse: false,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() {
                  if (data.docs[index]['started']) {
                    globals.video_key = data.docs[index]['content'];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubeVideo(),
                      ),
                    );
                    DatabaseService().getLesson();
                    //print(globals.lessons.length);
                  } else {
                    showAlertDialog(context);
                  }
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
                          child: (data.docs[index]['started'])
                              ? SvgPicture.asset(
                                  'assets/svgs/circle-play-solid 8.svg')
                              : SvgPicture.asset(
                                  'assets/svgs/circle-play-solid 2.svg')),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 205,
                              child: Text(
                                '${data.docs[index]['name']}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
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
                                  style: const TextStyle(
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

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("Ойлголоо"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('Уг хичээлийг үзэх боломжгүй'),
    content: Text(
        'Та өмнөх хичээлээ амжилттай судалж дуусгаснаар уг хичээлийг үзэх боломжтой.'),
    actions: [
      okButton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
