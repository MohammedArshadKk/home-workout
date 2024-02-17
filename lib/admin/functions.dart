import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> showDaysListAsStream() {
  return FirebaseFirestore.instance.collection('admin').orderBy('id').snapshots();
}
