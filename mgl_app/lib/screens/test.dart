import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mgl_app/data/globals.dart' as globals;

class TestQuiz extends StatefulWidget {
  const TestQuiz({Key? key}) : super(key: key);

  @override
  State<TestQuiz> createState() => _TestQuizState();
}

class _TestQuizState extends State<TestQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
            itemCount: globals.questions.length,
            itemBuilder: (context, index) {
              print('test quiz huudas ruu irew');
              print(globals.questions.length);
              print(globals.questions[0].question);
              if (globals.questions[index].question != null &&
                  globals.questions[index].answers != null) {
                //if (globals.questions != null) {
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
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    for (int i = 0;
                        i < globals.questions[index].answers!.length;
                        i++)
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                            globals.questions[index].answers!.keys.toList()[i]),
                      ),
                  ],
                );
              }
              return Container(
                child: Text('hooson'),
              );
            }),
      ),
    );
  }
}
