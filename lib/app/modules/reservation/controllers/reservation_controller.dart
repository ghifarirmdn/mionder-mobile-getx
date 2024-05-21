import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/snackbar.dart';

class ReservationController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DateTime? setDay;
  var selectedPaymentMethod = ''.obs;

  // Future<QuerySnapshot<Object?>> getDoctor() async {
  //   CollectionReference doctor = firestore.collection('doctor');

  //   return await doctor.get();
  // }

  Stream<QuerySnapshot<Object?>> getDoctor() {
    CollectionReference doctor = firestore.collection('doctor');
    return doctor.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getDoctorById(String id) async {
    DocumentReference docRef = firestore.collection('doctor').doc(id);
    return docRef.get();
  }

  Future<void> addTracker(
      String date, String doctorName, String payment, String specialist) {
    CollectionReference tracker = firestore.collection('history');
    return tracker.add({
      'date': date,
      'doctor_name': doctorName,
      'payment': payment,
      'specialist': specialist,
    }).then((value) {
      // Get.back();
      // MySnakebar.success(
      //     title: "Success!", subtitle: "Success Booking your doctor!");
      Get.dialog(
        Theme(
          data: ThemeData(
            cardColor: white,
          ),
          child: AlertDialog(
            alignment: Alignment.center,
            title: const Text(
              "Success booking your doctor!",
              textAlign: TextAlign.center,
            ),
            content: const Text("Link meet: https://meet.google.com/"),
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
      MySnakebar.success(title: "Error!", subtitle: "$error");
    });
  }

  void setSelectedPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  Future<void> setDate(BuildContext context) async {
    showCalendarDatePicker2Dialog(
      dialogBackgroundColor: white,
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        cancelButton: const Text('Batal'),
      ),
      dialogSize: Size(Get.width * 0.8, 200),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
              surface: white,
            ),
          ),
          child: child!,
        );
      },
    ).then(
      (selectedDate) {
        if (selectedDate != null) {
          setDay = selectedDate.first;
          log("Tanggal dipilih: $setDay");

          update();
        } else {
          log("Tanggal tidak dipilih");
        }
      },
    );
  }
}
