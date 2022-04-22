// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'package:mgl_app/screens/auth/login_screen.dart';

import '../data/database.dart';
import '../data/user.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget build(BuildContext context) {
    bool isSwitched = false;
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
                              '${snapshot.data?.name.toString()}',
                              maxLines: 2,
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${globals.auth.currentUser!.email}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                              ),
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
                  const Divider(
                    height: 20,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(196, 196, 196, 196),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 3, 0, 5),
                    alignment: Alignment.centerLeft,
                    child: const SizedBox(
                      height: 20,
                      child: Text(
                        'Статистикууд:',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    height: 240,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 11 / 6,
                      children: [
                        StatisticWidget(
                          text: 'Нийт суралцсан цаг',
                          svgPath: 'assets/svgs/clock-solid 1.svg',
                        ),
                        StatisticWidget(
                          text: 'Нийт цуглуулсан оноо',
                          svgPath: 'assets/svgs/Vector_coin.svg',
                        ),
                        StatisticWidget(
                          text: 'Одоогийн түвшин',
                          svgPath: 'assets/svgs/ranking-star-solid 1.svg',
                        ),
                        StatisticWidget(
                          text: 'Нийт хичээлийн процесс',
                          svgPath: 'assets/svgs/bell-solid 1.svg',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
                    alignment: Alignment.centerLeft,
                    child: const SizedBox(
                      height: 25,
                      child: Text(
                        'Тохиргоо:',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(45, 15, 45, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                'assets/svgs/bell-solid 1.svg',
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Notification илгээх',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.left,
                            ),
                            // Switch(
                            //     value: isSwitched,
                            //     activeColor: Colors.green,
                            //     onChanged: (value) {
                            //       isSwitched = value;
                            //     })
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                          color: Color.fromARGB(196, 196, 196, 196),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                'assets/svgs/fire-solid 2.svg',
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Мэдээлэл өөрчлөх',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                          color: Color.fromARGB(196, 196, 196, 196),
                        ),
                        GestureDetector(
                          onTap: () => {
                            globals.auth.signOut(),
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()))
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: SvgPicture.asset(
                                  'assets/svgs/fire-solid 4.svg',
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Гарах',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //     child: Text(
                  //       'Garah',
                  //       style: TextStyle(
                  //         fontFamily: 'Nunito',
                  //         fontSize: 24,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       globals.auth.signOut();
                  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //           builder: (context) => LoginScreen()));
                  //     }),
                ],
              );
            }),
      ),
    );
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

class StatisticWidget extends StatelessWidget {
  final String text;
  final String svgPath;

  const StatisticWidget({
    Key? key,
    required this.text,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(top: 20, left: 16.0, right: 16.0, bottom: 0),
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          //color: const Color.fromRGBO(229, 229, 229, 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(4, 8),
            )
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 15.0),
          SvgPicture.asset(svgPath),
        ],
      ),
    );
  }
}
