import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mgl_app/screens/auth/register_screen.dart';
import 'package:mgl_app/screens/main_screen.dart';
import 'package:mgl_app/data/globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDesktopPadding * 2),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 275.0,
                    width: 275.0,
                    child: Image.asset(
                      'assets/images/login_image.png',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(Icons.email),
                        border: UnderlineInputBorder(),
                        hintText: 'Цахим шуудан'),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  const SizedBox(height: kDesktopPadding),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(Icons.lock),
                        border: UnderlineInputBorder(),
                        hintText: 'Нууц үг'),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                  const SizedBox(
                    height: kDesktopPadding * 2.5,
                  ),
                  ElevatedButton(
                      child: Text(
                        'Newtreh',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        globals.auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainScreen()));
                        // log("end irsse");
                        // log(globals.auth.currentUser!.uid.toString());
                      }),
                  // GestureDetector(
                  //   onTap: () {
                  //     auth.signInWithEmailAndPassword(
                  //         email: _email, password: _password);
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: (context) => MainScreen()));
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
                  //           'Нэвтрэх',
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
            const SizedBox(height: 24.0),
            SizedBox(
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Та доорх төрлүүдээр нэвтэрч болно',
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        color: Colors.red,
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        color: Colors.pink,
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Шинээр бүртгэл үүсгэх үү?',
                      style: const TextStyle(
                          color: Colors.black, fontFamily: 'Nunito'),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                ),
                          text: ' Бүртгүүлэх',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kDesktopPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
