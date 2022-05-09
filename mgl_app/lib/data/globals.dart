library globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mgl_app/data/user.dart';

import '../model/test_question.dart';
import 'lesson.dart';

var auth = FirebaseAuth.instance;
MyUser global_user =
    new MyUser(0, 0, 5, 0, 'dummy', false, Timestamp.now(), false, 0);

String type = '';

List<TestQuestion> questions = [];

String cali_key = '';
String cali_type = '';
String cali_spe = '';
String video_key = '';
String exam_id = '';

List<MainLesson> lessons = [];
int progress = 0;
