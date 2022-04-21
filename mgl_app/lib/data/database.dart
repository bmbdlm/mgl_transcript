import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        final MyUser userz = new MyUser(
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
}
