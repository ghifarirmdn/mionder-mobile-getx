import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TrackerController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> getTracker() {
    CollectionReference tracker = firestore.collection('history');
    return tracker.snapshots();
  }
}
