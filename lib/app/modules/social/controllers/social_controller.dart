import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/snackbar.dart';

class SocialController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final commentController = TextEditingController();
  final nameController = TextEditingController();

  Stream<QuerySnapshot<Object?>> getReviews() {
    CollectionReference reviews = firestore.collection('reviews');
    return reviews.snapshots();
  }

  Future<void> addReviews(String name, String comment) {
    CollectionReference tracker = firestore.collection('reviews');
    return tracker.add({
      'name': name,
      'comment': comment,
    }).then((value) {
      Get.dialog(
        Theme(
          data: ThemeData(
            cardColor: white,
          ),
          child: AlertDialog(
            alignment: Alignment.center,
            title: const Text(
              "Success add your reviews!",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      );
    }).catchError((error) {
      MySnakebar.success(title: "Success!", subtitle: "$error");
    });
  }
}
