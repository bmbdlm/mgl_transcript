// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:mgl_app/constants.dart';
import 'package:mgl_app/screens/auth/register_screen.dart';
import 'package:mgl_app/screens/main_screen.dart';
import 'package:mgl_app/data/globals.dart' as globals;

import '../../data/globals.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;

  Future<User?> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result =
          await globals.auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
        return user;
      }
    }
  }

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
                    decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(Icons.email),
                        border: UnderlineInputBorder(),
                        hintText: '?????????? ????????????'),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  const SizedBox(height: kDesktopPadding),
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(Icons.lock),
                        border: UnderlineInputBorder(),
                        hintText: '???????? ????'),
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
                      child: const Text(
                        '??????????????',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainScreen()));
                      }),
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
                    '???? ?????????? ???????????????????? ?????????????? ??????????',
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => {signup(context)},
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: SvgPicture.asset('assets/svgs/google.svg'),
                        ),
                      ),
                      Container(
                        height: 48.0,
                        width: 48.0,
                        //color: Colors.blue,
                        child: SvgPicture.asset('assets/svgs/facebook.svg'),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: '???????????? ?????????????? ???????????? ?????',
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
                          text: ' ????????????????????',
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
