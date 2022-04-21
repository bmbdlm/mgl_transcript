// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mgl_app/data/globals.dart' as globals;
import 'package:mgl_app/data/user.dart';

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
    //);