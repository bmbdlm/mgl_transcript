import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mgl_app/data/globals.dart' as globals;

class ChangeInfo extends StatefulWidget {
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  State<ChangeInfo> createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  late String _username, _oldpassword, _newpassword;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 108, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Text(
                  'Хувийн мэдээлэл өөрчлөх',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(37, 20, 37, 0),
                height: 570,
                padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Хэрэглэгчийн нэр',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: '${globals.user}',
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              //hintText: '${globals.user}',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _username = value.trim();
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Old password',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: ' Old password'),
                            onChanged: (value) {
                              setState(() {
                                _oldpassword = value.trim();
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'New password',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'New password'),
                            onChanged: (value) {
                              setState(() {
                                _newpassword = value.trim();
                              });
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                          child: const Text(
                            'Хадгалах',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            // String userId = ' ';
                            // await FirebaseAuth.instance
                            //     .createUserWithEmailAndPassword(
                            //         email: _email, password: _password)
                            //     .then(
                            //         (value) => userId = value.user!.uid.toString());
                            // DatabaseService().addUser(userId, _username);
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //     builder: (context) => MainScreen()));
                          }),
                      SizedBox(
                        height: 50,
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}
