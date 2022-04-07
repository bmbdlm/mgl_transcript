import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(50, 100, 20, 30),
          child: Column(
            children: [
              Text(
                '1. Дараах хариултуудаас зөв хариултыг олно уу?',
                style: TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Text('Хариулт 1'),
              ),
            ],
          )),
    );
    // return Scaffold(
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Container(
    //         height: 50,
    //         width: 300,
    //         child: Text(
    //           '1. Дараах хариултуудаас зөв хариултыг олно уу?',
    //           style: TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
    //         ),
    //       ),
    // Container(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: 52.0,
    //         width: 261,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(15.0),
    //             border: Border.all(color: Colors.black)),
    //         child: Text(
    //           'Хариулт 1',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontFamily: 'Nunito',
    //             fontSize: 23.0,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // SizedBox(
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 52.0,
    //         width: 261,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(15.0),
    //             border: Border.all(color: Colors.black)),
    //         child: Text(
    //           'Хариулт 4',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontFamily: 'Nunito',
    //             fontSize: 23.0,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // )
  }
}
