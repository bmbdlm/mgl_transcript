// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CaliScreen extends StatelessWidget {
  const CaliScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Column(children: [
        const SizedBox(
          height: 40,
          child: Text(
            'Үсгүүдийн үндсэн зурлагууд',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 21.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Үе/үсэг',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.0,
              ),
            ),
            const Text(
              'Эхэн',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.0,
              ),
            ),
            const Text(
              'Дунд',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.0,
              ),
            ),
            const Text(
              'Адаг',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'А үсэг',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'а',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'а',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'а',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'Э үсэг',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'э',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'э',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
                height: 67,
                width: 67,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(229, 229, 229, 0.5)),
                child: const Center(
                  child: Text(
                    'э',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        )
        // GridView.builder(
        //     itemCount: 16,
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 4,
        //       childAspectRatio: 1.2,
        //       mainAxisSpacing: 0.0,
        //       crossAxisSpacing: 0.0,
        //     ),
        //     itemBuilder: (context, index) {
        //       return Container(
        //           margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 5),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: const Color.fromRGBO(229, 229, 229, 0.5),
        //           ),
        //           height: 160,
        //           child: const Center(
        //               child: Text('Сонгох шалгалт',
        //                   maxLines: 2,
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     fontFamily: 'Nunito',
        //                     fontSize: 24.0,
        //                   ))));
        //     })
        // Column(
        //   mainAxisAlignment: ,
        //   children: [
        //     Row(
        //       children: [
        //         Text('A useg'),
        //       ],
        //     )
        //   ],
        // )

        // GridView.builder(
        //     padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 4,
        //       childAspectRatio: 1.2,
        //       mainAxisSpacing: 15.0,
        //       crossAxisSpacing: 8.0,
        //     ),
        //     itemBuilder: (context, index) {
        //       return Container(
        //           margin: const EdgeInsets.all(8.0),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: const Color.fromRGBO(229, 229, 229, 0.5),
        //           ),
        //           child: const Center(
        //               child: Text(
        //             'А үсэг',
        //             style: TextStyle(
        //               fontSize: 16.0,
        //               fontFamily: 'Nunito',
        //               fontWeight: FontWeight.bold,
        //             ),
        //           )));
        //     }),
      ]),
    ));
  }
}
