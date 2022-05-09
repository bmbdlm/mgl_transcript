// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/data/database.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'package:mgl_app/screens/quiz.dart';

class ExamsScreen extends StatelessWidget {
  ExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> exams = FirebaseFirestore.instance
        .collection('exam')
        .where("examType", isEqualTo: globals.type)
        .snapshots();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 117, 30, 0),
        child: StreamBuilder<QuerySnapshot>(
          stream: exams,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading');
            }
            final data = snapshot.requireData;

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (() {
                    showAlertDialog(context, data.docs[index].id,
                        data.docs[index]['requiredExp']);
                  }),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),

                      //color: Colors.black,
                    ),
                    height: 94,
                    child: Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Шалгалт № ${data.docs[index]['number']}",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 23.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            '${data.docs[index]['requiredExp']} exp',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(94, 94, 94, 94)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 80,
                        height: 10,
                      ),
                      Container(
                        width: 90,
                        height: 62,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset(
                            'assets/svgs/arrow-right-solid 1.svg',
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String examId, int exp) {
  Widget cancelButton = TextButton(
    child: Text("Болих"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget okButton = TextButton(
    child: Text("Тийм"),
    onPressed: () async {
      globals.exam_id = examId;
      await DatabaseService().getQuestions(examId);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => QuizTest()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Мэдлэг сорих шалгалт"),
    content: Text(
        'Та ${exp} exp оноотой дүйх уг шалгалтыг эхлүүлэхдээ итгэлтэй байна уу?'),
    actions: [
      cancelButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

ShowWarningDialog(BuildContext context, int exp, int health) {
  Widget cancelButton = TextButton(
    child: Text("Болих"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget okButton = TextButton(
    child: Text("Тийм"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Мэдлэг сорих шалгалт"),
    content: Text(''),
    actions: [
      cancelButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
