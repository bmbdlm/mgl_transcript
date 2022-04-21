// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  late int daysStreak;
  late int exp;
  late int health;
  late int learnedTime;
  late String name;
  late bool notification;
  late Timestamp registrationDate;
  late bool skipped;
  late int skippedDays;

  MyUser(int ds, int ex, int he, int lt, String na, bool no, Timestamp rd,
      bool s, int sd) {
    this.daysStreak = ds;
    this.exp = ex;
    this.health = he;
    this.learnedTime = lt;
    name = na;
    this.notification = no;
    this.registrationDate = rd;
    this.skipped = s;
    this.skippedDays = sd;
  }
}
