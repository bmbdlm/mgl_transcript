// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mgl_app/screens/zurlaga.dart';
import 'package:mgl_app/data/globals.dart' as globals;

import '../data/database.dart';

class CaliScreen extends StatelessWidget {
  CaliScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> calis = FirebaseFirestore.instance
      .collection('calligraph')
      .orderBy('number', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: StreamBuilder<QuerySnapshot>(
        stream: calis,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          final data = snapshot.requireData;
          return ListView.builder(
            itemCount: data.size,
            reverse: false,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 67,
                          width: 67,
                          margin: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '${data.docs[index]['text']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          globals.cali_type = 'эхэнд';
                          globals.cali_key = data.docs[index]['initial'];
                          globals.cali_spe = data.docs[index]['specific'];
                          DatabaseService().getLesson();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Zurlaga(),
                            ),
                          );
                        },
                        child: Container(
                          height: 67,
                          width: 67,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            const SizedBox(
                              height: 27,
                            ),
                            const Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black,
                            ),
                            Text(
                              '${data.docs[index]['specific']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          globals.cali_type = 'дунд';
                          globals.cali_key = data.docs[index]['following'];
                          globals.cali_spe = data.docs[index]['specific'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Zurlaga(),
                            ),
                          );
                        }),
                        child: Container(
                          height: 67,
                          width: 67,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            const SizedBox(
                              height: 27,
                            ),
                            const Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black,
                            ),
                            Text(
                              '${data.docs[index]['specific']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          globals.cali_type = 'адагт';
                          globals.cali_key = data.docs[index]['final'];
                          globals.cali_spe = data.docs[index]['specific'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Zurlaga(),
                            ),
                          );
                        }),
                        child: Container(
                          height: 67,
                          width: 67,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            const SizedBox(
                              height: 27,
                            ),
                            const Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black,
                            ),
                            Text(
                              '${data.docs[index]['specific']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ]),
                        ),
                      )
                    ]),
              );
            },
          );
        },
      ),
    );
  }
}
