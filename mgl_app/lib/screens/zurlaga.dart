import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Zurlaga extends StatelessWidget {
  const Zurlaga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> calis =
        FirebaseFirestore.instance.collection('calligraph').snapshots();
    return Container();
  }
}
