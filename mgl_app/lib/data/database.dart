// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mgl_app/data/globals.dart' as globals;
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
        print(ds.data());
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

  Future<void> getQuestions(String examid) async {
    QuerySnapshot querySnapshot = await
        //print(examid);
        FirebaseFirestore.instance
            .collection('question')
            .where('examID', isEqualTo: examid)
            .get();

    print('shalgaltiin id: ' + examid);
    print('asuultiin too:' + querySnapshot.docs.length.toString());
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
          //print('end boloh estoi');
          //print(answer[doc['first']]);
          answer['${doc['second']}'] = false;
          //print(answer[doc['second']]);
          answer['${doc['third']}'] = false;
          //print('tusgaarlah zuraas' + answer[doc['third']].toString());
          //print(answer[doc['third']]);
          answer['${doc['fourth']}'] = false;
          //print(answer[doc['fourth']]);
          //print('if ees garaw');
        } else if (doc['second'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = false;
          //print('end boloh estoi');
          //print(answer[doc['first']]);
          answer['${doc['second']}'] = true;
          //print(answer[doc['second']]);
          answer['${doc['third']}'] = false;
          //print(answer[doc['third']]);
          answer['${doc['fourth']}'] = false;
          //print(answer[doc['fourth']]);
          //print('if ees garaw');
        } else if (doc['third'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = false;
          //print('end boloh estoi');
          //print(answer[doc['first']]);
          answer['${doc['second']}'] = false;
          //print(answer[doc['second']]);
          answer['${doc['third']}'] = true;
          //print(answer[doc['third']]);
          answer['${doc['fourth']}'] = false;
          //print(answer[doc['fourth']]);
          //print('if ees garaw');
        } else if (doc['fourth'] == doc['correctAnswer']) {
          answer['${doc['first']}'] = false;
          //print('end boloh estoi');
          //print(answer[doc['first']]);
          answer['${doc['second']}'] = false;
          //print(answer[doc['second']]);
          answer['${doc['third']}'] = false;
          //print(answer[doc['third']]);
          answer['${doc['fourth']}'] = true;
          //print(answer[doc['fourth']]);
          //print('if ees garaw');
        }
        //print('garsan if end irew');
        print('|------------|');
        print(answer[doc['first']]);
        print(answer[doc['second']]);
        print(answer[doc['third']]);
        print(answer[doc['fourth']]);
        print('}--------------}');
        TestQuestion tmp = TestQuestion(doc['body'], answer, doc['answerDesc']);
        globals.questions.add(tmp);
      } else {
        print('aldaa');
      }
    }
    print('asuultiin urt');
    print(globals.questions.length);
  }
}

// users.add({
//   'uid': uid,
//   'name': userName,
//   'daysStreak': 0,
//   'exp': 0,
//   'health': 5,
//   'learnedTime': 0,
//   'notification': true,
//   'registrationDate': Timestamp.now(),
//   'skipped': false,
//   'skippedDays': 0
// }
//);?
