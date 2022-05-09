// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'package:mgl_app/data/lesson.dart';
import 'package:mgl_app/data/user.dart';
import 'package:mgl_app/model/test_question.dart';

class DatabaseService {
  Future<MyUser?> getData() async {
    final user = globals.auth.currentUser;
    if (user != null) {
      DocumentSnapshot ds = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (ds.exists) {
        final MyUser userz = MyUser(
            ds.get('daysStreak'),
            ds.get('exp'),
            ds.get('health'),
            ds.get('learnedTime'),
            ds.get('name'),
            ds.get('notification'),
            ds.get('registrationDate'),
            ds.get('skipped'),
            ds.get('skippedDays'));
        globals.global_user = userz;
        return userz;
      } else {
        print('Document does not exist on the database');
      }
    }
  }

  Future<void> addUser(String userid, String userName) async {
    await FirebaseFirestore.instance.collection('users').doc(userid).set({
      'name': userName,
      'daysStreak': 0,
      'exp': 0,
      'health': 5,
      'learnedTime': 0,
      'notification': true,
      'registrationDate': Timestamp.now(),
      'skipped': false,
      'skippedDays': 0
    });
    String uid = globals.auth.currentUser!.uid.toString();
  }

  Future<void> updateExp(String userId, int exp) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'exp': exp});
  }

  Future<void> examDone(String examID, bool isDone) async {
    await FirebaseFirestore.instance
        .collection('exams')
        .doc(examID)
        .update({'completed': isDone});
  }

  Future<void> getQuestions(String examid) async {
    QuerySnapshot querySnapshot = await
        //print(examid);
        FirebaseFirestore.instance
            .collection('question')
            .where('examID', isEqualTo: examid)
            .get();
    ;
    for (var doc in querySnapshot.docs) {
      if (doc['first'] != null &&
          doc['correctAnswer'] != null &&
          doc['second'] != null &&
          doc['third'] != null &&
          doc['fourth'] != null) {
        print(doc['correctAnswer']);
        Map<String, bool>? answer = {};
        if (doc['first'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = true;
          answer['${doc['second']}'] = false;
          answer['${doc['third']}'] = false;
          answer['${doc['fourth']}'] = false;
        } else if (doc['second'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = false;
          answer['${doc['second']}'] = true;
          answer['${doc['third']}'] = false;
          answer['${doc['fourth']}'] = false;
        } else if (doc['third'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = false;
          answer['${doc['second']}'] = false;
          answer['${doc['third']}'] = true;
          answer['${doc['fourth']}'] = false;
        } else if (doc['fourth'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = false;
          answer['${doc['second']}'] = false;
          answer['${doc['third']}'] = false;
          answer['${doc['fourth']}'] = true;
        }
        TestQuestion tmp = TestQuestion(doc['body'], answer, doc['answerDesc']);
        print(tmp);
        globals.questions.add(tmp);
      } else {
        print('aldaa');
      }
    }
  }

  Future<MainLesson?> getLesson() async {
    QuerySnapshot sn = await FirebaseFirestore.instance
        .collection('Lesson')
        .orderBy('number')
        .get();
    print(sn.size);
    for (int i = 0; i < sn.size; i++) {
      //print(sn.docs[i]['watchedTime']);
      MainLesson tmp = new MainLesson(
          sn.docs[i]['content'],
          sn.docs[i]['name'],
          sn.docs[i]['number'],
          sn.docs[i]['started'],
          sn.docs[i]['time'],
          sn.docs[i]['watchedTime'],
          sn.docs[i]['completed']);
      globals.lessons.add(tmp);
    }
  }

  countProgress() {
    //print('Хичээлийн урт' + globals.lessons.length.toString());
    for (int i = 0; i < globals.lessons.length; i++) {
      if (globals.lessons[i].started == true) {
        globals.progress++;
      } else {}
    }
  }

  updateCalli(String key) {}
}
