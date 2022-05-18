// ignore_for_file: unused_local_variable

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'dart:convert';

import 'package:mgl_app/screens/cali_screen.dart';

class Zurlaga extends StatefulWidget {
  Zurlaga({Key? key}) : super(key: key);

  @override
  State<Zurlaga> createState() => _Zurlaga();
}

class _Zurlaga extends State<Zurlaga> {
  List<Offset> points = [];
  Uint8List zurag = base64Decode(globals.cali_key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Text(
                "Дараах зурлагыг дагаад зураарай.",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Үгийн ${globals.cali_type} ордог ${globals.cali_spe} үсэг",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black),
                    ),
                child: Image.memory(zurag),
              ),
              Container(
                width: 300,
                height: 450,
                child: GestureDetector(
                  onPanDown: ((details) => {
                        this.setState(() {
                          points.add(details.localPosition);
                        })
                      }),
                  onPanUpdate: ((details) => {
                        this.setState(() {
                          points.add(details.localPosition);
                        })
                      }),
                  onPanEnd: ((details) => {
                        this.setState(() {
                          var value2 = null;
                          points.add(value2);
                        })
                      }),
                  child: CustomPaint(
                    painter: CaliCustomPainter(points),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 52,
              width: 322,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)),
              child: Text(
                'Болсон',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 23.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CaliCustomPainter extends CustomPainter {
  List<Offset> points;
  CaliCustomPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.transparent;
    Rect react = Rect.fromLTWH(0, 0, 290, 450);
    canvas.drawRect(react, background);

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 18.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(points[x], points[x + 1], paint);
      } else if (points[x] != null && points[x + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[x]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
