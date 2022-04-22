// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
                fontWeight: FontWeight.w800),
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
                  fontWeight: FontWeight.w800),
            ),
            const Text(
              'Эхэн',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(94, 94, 94, 94)),
            ),
            const Text(
              'Дунд',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(94, 94, 94, 94)),
            ),
            const Text(
              'Адаг',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(94, 94, 94, 94)),
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
                child: const Center(
                  child: Text(
                    'А үсэг',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )),
            Container(
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
                  'а',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ]),
            ),
            Container(
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
                  'а',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ]),
            ),
            Container(
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
                  'а',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ]),
            ),
          ],
        ),
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
