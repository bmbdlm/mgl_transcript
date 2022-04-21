// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'package:mgl_app/screens/auth/login_screen.dart';

import '../data/database.dart';
import '../data/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _email, _password;

    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<MyUser?>(
            future: DatabaseService().getData(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${snapshot.data!.name.toString()}',
                              maxLines: 2,
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${globals.auth.currentUser!.email}',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text(
                      'Статистик',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 10 / 6,
                    children: [
                      StatisticWidget(
                        text: 'Нийт суралцсан цаг',
                        svgPath: Icons.lock_clock,
                      ),
                      StatisticWidget(
                        text: 'Нийт цуглуулсан оноо',
                        svgPath: Icons.power_input,
                      ),
                      StatisticWidget(
                        text: 'Одоогийн түвшин',
                        svgPath: Icons.graphic_eq_outlined,
                      ),
                      StatisticWidget(
                        text: 'Нийт хичээлийн процесс',
                        svgPath: Icons.percent,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 25,
                    child: Text(
                      'Тохиргоо',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ElevatedButton(
                      child: Text(
                        'Garah',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        globals.auth.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                ],
              );
            }),
      ),
    );
  }
}

class StatisticWidget extends StatelessWidget {
  final String text;
  final IconData svgPath;

  const StatisticWidget({
    Key? key,
    required this.text,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 16.0, right: 16.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(229, 229, 229, 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(text),
          ),
          const SizedBox(width: 8.0),
          Icon(svgPath)
        ],
      ),
    );
  }
}
