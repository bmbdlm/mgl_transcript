library globals;

import 'package:firebase_auth/firebase_auth.dart';

import '../model/test_question.dart';

var auth = FirebaseAuth.instance;
var user = '';

String type = '';

List<TestQuestion> questions = [];
