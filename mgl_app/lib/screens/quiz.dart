import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mgl_app/data/globals.dart' as globals;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
            //physics: const NeverScrollableScrollPhysics(),
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
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Асуулт ${index + 1}/${globals.questions.length}',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          fontSize: 21.0,
                        ),
                      ),
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
                          color: isPresssed
                              ? globals.questions[index].answers!.entries
                                      .toList()[i]
                                      .value
                                  ? isTrue
                                  : isWrong
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.black)),
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
                                    print(score);
                                  }
                                },
                          child: Text(
                            globals.questions[index].answers!.keys.toList()[i],
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 60.0,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          print(isPresssed);
                          isPresssed
                              ? _controller!.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.easeIn)
                              : null;
                        },
                        child: Text(
                          index + 1 == globals.questions.length
                              ? "Шалгалтын дүн харах"
                              : "Шалгах",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                );
              } else {
                return Container(
                  child: Text('hooson'),
                );
              }
            }),
      ),
    );
  }
}
