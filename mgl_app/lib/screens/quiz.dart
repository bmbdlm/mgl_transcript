import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/data/database.dart';
import 'package:mgl_app/data/globals.dart' as globals;

import 'exam_screen.dart';
import 'exams.dart';

class QuizTest extends StatefulWidget {
  const QuizTest({Key? key}) : super(key: key);

  @override
  State<QuizTest> createState() => _QuizTestState();
}

class _QuizTestState extends State<QuizTest> {
  final PageController? _controller = PageController(initialPage: 0);
  bool isPresssed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.white;
  int score = 0;
  int health = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (page) {
              setState(() {
                isPresssed = false;
              });
            },
            itemCount: globals.questions.length,
            itemBuilder: (context, index) {
              if (globals.questions[index].question != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Асуулт ${index + 1}/${globals.questions.length}',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 21.0,
                            ),
                          ),
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
                            const SizedBox(width: 10.0),
                            Text('${globals.global_user.health}',
                                style: TextStyle(
                                    color: Color(0xFFEF476F),
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.0)),
                            const SizedBox(width: 10.0),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2.0,
                      height: 8,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${index + 1}. ' + globals.questions[index].question!,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    for (int i = 0;
                        i < globals.questions[index].answers!.length;
                        i++)
                      Container(
                        width: 260,
                        height: 52,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: MaterialButton(
                          color:
                              //isPresssed
                              // ? globals.questions[index].answers!.entries
                              //         .toList()[i]
                              //         .value
                              //     ? isTrue
                              //     : isWrong
                              Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  color: isPresssed
                                      ? globals
                                              .questions[index].answers!.entries
                                              .toList()[i]
                                              .value
                                          ? isTrue
                                          : isWrong
                                      : Colors.white)),
                          onPressed: isPresssed
                              ? () {}
                              : () {
                                  setState(() {
                                    isPresssed = true;
                                  });
                                  if (globals.questions[index].answers!.entries
                                      .toList()[i]
                                      .value) {
                                    score += 10;
                                    //print(score);
                                  } else {
                                    globals.global_user.health -= 1;
                                  }
                                },
                          child: Text(
                            globals.questions[index].answers!.keys.toList()[i],
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0,
                                color: isPresssed
                                    ? globals.questions[index].answers!.entries
                                            .toList()[i]
                                            .value
                                        ? isTrue
                                        : isWrong
                                    : Colors.black),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 120.0,
                    ),
                    Container(
                      width: 300,
                      height: 55,
                      child: OutlinedButton(
                          onPressed:
                              //() {
                              isPresssed
                                  ? () {
                                      if (index + 1 ==
                                          globals.questions.length) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        // ShowDialog(context, 60);
                                      } else {
                                        _controller!.nextPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeIn);
                                      }
                                    }
                                  : null,
                          //},
                          child: Text(
                            index + 1 == globals.questions.length
                                ? "Шалгалт дуусгах"
                                : "Дараагийнх",
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                );
              } else {
                return Container(
                  child: Text('Loading...'),
                );
              }
            }),
      ),
    );
  }
}

void ShowDialog(BuildContext context, int exp) {
  Widget okButton = TextButton(
    child: Text("Ок"),
    onPressed: () async {
      print("userId:" + globals.auth.currentUser!.uid.toString());
      print("exp:" + globals.global_user.exp.toString());
      DatabaseService().updateExp(
          globals.auth.currentUser!.uid, globals.global_user.exp + exp);
      DatabaseService().examDone(globals.exam_id, true);

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     settings: RouteSettings(name: ""),
      //     builder: (context) => ExamsScreen(),
      //   ),
      // );
      // int count = 0;
      // Navigator.of(context).popUntil((_) {
      //   return count++ >= 2;

      // });
      Navigator.pop(context);
      // Navigator.pop(context);
      // Navigator.pop(context);
      //print(ModalRoute.of(context)?.settings.name);

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ExamsScreen(),
      //   ),
      // );

      //Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Танд баяр хүргэе. Та нийт ${exp} Xp цуглууллаа."),
    content: Text(''),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
