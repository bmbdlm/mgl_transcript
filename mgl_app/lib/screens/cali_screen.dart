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
                              //'${data.docs[index].id}',
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
                          // print(
                          //     'Үгийн ${globals.cali_type} ордог ${globals.cali_spe} үсэг');
                          // print(globals.cali_key);
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
                          // print(
                          //     'Үгийн ${globals.cali_type} ордог ${globals.cali_spe} үсэг');
                          // print(globals.cali_key);
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
                          // print(
                          //     'Үгийн ${globals.cali_type} ордог ${globals.cali_spe} үсэг');
                          // print(globals.cali_key);
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
          // return Container(
          //   child: Column(
          //     children: [
          // const SizedBox(
          //   height: 40,
          //   child: Text(
          //     'Үсгүүдийн үндсэн зурлагууд',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         fontFamily: 'Nunito',
          //         fontSize: 21.0,
          //         fontWeight: FontWeight.w800),
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     const Text(
          //       'Үе/үсэг',
          //       textAlign: TextAlign.left,
          //       style: TextStyle(
          //           fontFamily: 'Nunito',
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.w800),
          //     ),
          //     const Text(
          //       'Эхэн',
          //       style: TextStyle(
          //           fontFamily: 'Nunito',
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.w800,
          //           color: Color.fromARGB(94, 94, 94, 94)),
          //     ),
          //     const Text(
          //       'Дунд',
          //       style: TextStyle(
          //           fontFamily: 'Nunito',
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.w800,
          //           color: Color.fromARGB(94, 94, 94, 94)),
          //     ),
          //     const Text(
          //       'Адаг',
          //       style: TextStyle(
          //           fontFamily: 'Nunito',
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.w800,
          //           color: Color.fromARGB(94, 94, 94, 94)),
          //     ),
          //   ],
          // ),
          // ListView.builder(
          //   itemCount: data.size,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       child: Row(children: [
          //         Container(
          //             height: 67,
          //             width: 67,
          //             margin: const EdgeInsets.all(8.0),
          //             child: const Center(
          //               child: Text(
          //                 'А үсэг',
          //                 style: TextStyle(
          //                   fontSize: 16.0,
          //                   fontFamily: 'Nunito',
          //                   fontWeight: FontWeight.w800,
          //                 ),
          //               ),
          //             )),
          //       ]),
          //     );
          //   },
          // ),
          //     ],
          //   ),
          // );
        },
      ),
    );

    //       Container(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    //   Container(
    //       height: 67,
    //       width: 67,
    //       margin: const EdgeInsets.all(8.0),
    //       child: const Center(
    //         child: Text(
    //           'А үсэг',
    //           style: TextStyle(
    //             fontSize: 16.0,
    //             fontFamily: 'Nunito',
    //             fontWeight: FontWeight.w800,
    //           ),
    //         ),
    //       )),
    // Container(
    //   height: 67,
    //   width: 67,
    //   alignment: Alignment.bottomCenter,
    //   margin: const EdgeInsets.all(8.0),
    //   decoration: BoxDecoration(
    //       border: Border.all(color: Colors.black),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: Column(children: [
    //     const SizedBox(
    //       height: 27,
    //     ),
    //     const Divider(
    //       thickness: 1,
    //       indent: 10,
    //       endIndent: 10,
    //       color: Colors.black,
    //     ),
    //     Text(
    //       'а',
    //       style: TextStyle(
    //         fontSize: 16.0,
    //         fontFamily: 'Nunito',
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //   ]),
    // ),
    //             Container(
    //               height: 67,
    //               width: 67,
    //               alignment: Alignment.bottomCenter,
    //               margin: const EdgeInsets.all(8.0),
    //               decoration: BoxDecoration(
    //                   border: Border.all(color: Colors.black),
    //                   borderRadius: BorderRadius.circular(10)),
    //               child: Column(children: [
    //                 const SizedBox(
    //                   height: 27,
    //                 ),
    //                 const Divider(
    //                   thickness: 1,
    //                   indent: 10,
    //                   endIndent: 10,
    //                   color: Colors.black,
    //                 ),
    //                 Text(
    //                   'а',
    //                   style: TextStyle(
    //                     fontSize: 16.0,
    //                     fontFamily: 'Nunito',
    //                     fontWeight: FontWeight.w800,
    //                   ),
    //                 ),
    //               ]),
    //             ),
    //             Container(
    //               height: 67,
    //               width: 67,
    //               alignment: Alignment.bottomCenter,
    //               margin: const EdgeInsets.all(8.0),
    //               decoration: BoxDecoration(
    //                   border: Border.all(color: Colors.black),
    //                   borderRadius: BorderRadius.circular(10)),
    //               child: Column(children: [
    //                 const SizedBox(
    //                   height: 27,
    //                 ),
    //                 const Divider(
    //                   thickness: 1,
    //                   indent: 10,
    //                   endIndent: 10,
    //                   color: Colors.black,
    //                 ),
    //                 Text(
    //                   'а',
    //                   style: TextStyle(
    //                     fontSize: 16.0,
    //                     fontFamily: 'Nunito',
    //                     fontWeight: FontWeight.w800,
    //                   ),
    //                 ),
    //               ]),
    //             ),
    //           ],
    //         ),
    //       ),
    //       GridView.builder(
    //           itemCount: 16,
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 4,
    //             childAspectRatio: 1.2,
    //             mainAxisSpacing: 0.0,
    //             crossAxisSpacing: 0.0,
    //           ),
    //           itemBuilder: (context, index) {
    //             return Container(
    //                 margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 5),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: const Color.fromRGBO(229, 229, 229, 0.5),
    //                 ),
    //                 height: 160,
    //                 child: const Center(
    //                     child: Text('Сонгох шалгалт',
    //                         maxLines: 2,
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                           fontFamily: 'Nunito',
    //                           fontSize: 24.0,
    //                         ))));
    //           }),
    //       GridView.builder(
    //           padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 4,
    //             childAspectRatio: 1.2,
    //             mainAxisSpacing: 15.0,
    //             crossAxisSpacing: 8.0,
    //           ),
    //           itemBuilder: (context, index) {
    //             return Container(
    //                 margin: const EdgeInsets.all(8.0),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: const Color.fromRGBO(229, 229, 229, 0.5),
    //                 ),
    //                 child: const Center(
    //                     child: Text(
    //                   'А үсэг',
    //                   style: TextStyle(
    //                     fontSize: 16.0,
    //                     fontFamily: 'Nunito',
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 )));
    //           }),
    //     ]),
    //   )),
    // );
  }
}
