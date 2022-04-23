// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mgl_app/screens/main_screen.dart';

import '../../constants.dart';
import 'package:mgl_app/data/globals.dart' as globals;

import '../../data/database.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String _email, _password, _username;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 96.0, bottom: 32.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          height: MediaQuery.of(context).size.height - 112,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: const Color.fromRGBO(255, 255, 255, 0.5),
          ),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Бүртгүүлэх',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.black,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Хэрэглэгчийн нэр'),
                  onChanged: (value) {
                    setState(() {
                      _username = value.trim();
                    });
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email), hintText: 'Цахим шуудан'),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock), hintText: 'Нууц үг'),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
                ElevatedButton(
                    child: const Text(
                      'Бүртгүүлэх',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      String userId = ' ';
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((value) => userId = value.user!.uid.toString());
                      DatabaseService().addUser(userId, _username);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MainScreen()));
                    }),
                // TextField(
                //   decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.lock), hintText: 'Нууц үг давт'),
                // ),
                // TextField(
                //   onChanged: (value) => setState(() {}),
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 45, 38, 38),
                //     fontWeight: FontWeight.bold,
                //   ),
                //   decoration: InputDecoration(
                //     hintStyle: const TextStyle(
                //       color: Color(0xff2c2e43cc),
                //     ),
                //     hintText: 'Таны нэр',
                //     fillColor: const Color.fromRGBO(255, 255, 255, 0.8),
                //     filled: true,
                //     contentPadding: const EdgeInsets.only(
                //       left: 16,
                //     ),
                //     border: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: kPrimaryColor, width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: Colors.white10, width: 3),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     disabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: kPrimaryColor.withAlpha(0), width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: kPrimaryColor.withAlpha(0), width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),
                // TextField(
                //   onChanged: (value) => setState(() {}),
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 45, 38, 38),
                //     fontWeight: FontWeight.bold,
                //   ),
                //   decoration: InputDecoration(
                //     hintStyle: const TextStyle(
                //       color: Color(0xff2c2e43cc),
                //     ),
                //     hintText: 'Цахим шуудан',
                //     fillColor: const Color.fromRGBO(255, 255, 255, 0.8),
                //     filled: true,
                //     contentPadding: const EdgeInsets.only(
                //       left: 16,
                //     ),
                //     border: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: kPrimaryColor, width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: Colors.white10, width: 3),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     disabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: kPrimaryColor.withAlpha(0), width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: kPrimaryColor.withAlpha(0), width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),
                // TextField(
                //   onChanged: (value) => setState(() {}),
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 45, 38, 38),
                //     fontWeight: FontWeight.bold,
                //   ),
                //   decoration: InputDecoration(
                //     hintStyle: const TextStyle(
                //       color: Color(0xff2c2e43cc),
                //     ),
                //     hintText: 'Нууц үг',
                //     fillColor: const Color.fromRGBO(255, 255, 255, 0.8),
                //     filled: true,
                //     contentPadding: const EdgeInsets.only(
                //       left: 16,
                //     ),
                //     border: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: kPrimaryColor, width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: Colors.white10, width: 3),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     disabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: kPrimaryColor.withAlpha(0), width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: kPrimaryColor.withAlpha(0), width: 0),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) => const MainScreen(),
                //     //   ),
                //     // );
                //   },
                //   child: PhysicalModel(
                //     elevation: 24.0,
                //     clipBehavior: Clip.hardEdge,
                //     borderRadius: BorderRadius.circular(25),
                //     color: kPrimaryColor,
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(kDesktopPadding),
                //         color: kPrimaryColor,
                //       ),
                //       height: 55.0,
                //       width: 210,
                //       child: const Center(
                //         child: Text(
                //           'Бүртгүүлэх',
                //           style: TextStyle(
                //             fontFamily: 'Nunito',
                //             fontSize: 24,
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
