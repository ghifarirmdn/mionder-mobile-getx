import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/utils/format_date_utils.dart';

class ConsultanCallView extends GetView<ReservationController> {
  const ConsultanCallView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final formKey = GlobalKey<FormState>();

    return FutureBuilder<DocumentSnapshot<Object?>>(
      future: controller.getDoctorById(Get.arguments),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data?.data() as Map<String, dynamic>;
          return GetBuilder(
            init: ReservationController(),
            builder: (controller) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xffFBFBFB),
                  title: Text(
                    "Consult with ${data["name"]}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Select Date',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              controller.setDate(context);
                            },
                            child: Text(controller.setDay != null
                                ? MyFormatDateUtils.dateEEEEddMMMMyyyy(
                                        date: controller.setDay)
                                    .toString()
                                : "Select the date"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Select Payment Method',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              RadioListTile<String>(
                                title: const Text('Dana'),
                                value: 'Dana',
                                groupValue:
                                    controller.selectedPaymentMethod.value,
                                activeColor: primaryColor,
                                onChanged: (String? value) {
                                  controller.setSelectedPaymentMethod(value!);
                                  log(controller.selectedPaymentMethod.value);
                                },
                              ),
                              RadioListTile<String>(
                                title: const Text('GoPay'),
                                value: 'GoPay',
                                groupValue:
                                    controller.selectedPaymentMethod.value,
                                activeColor: primaryColor,
                                onChanged: (String? value) {
                                  controller.setSelectedPaymentMethod(value!);
                                  log(controller.selectedPaymentMethod.value);
                                },
                              ),
                              RadioListTile<String>(
                                title: const Text('OVO'),
                                value: 'OVO',
                                groupValue:
                                    controller.selectedPaymentMethod.value,
                                activeColor: primaryColor,
                                onChanged: (String? value) {
                                  controller.setSelectedPaymentMethod(value!);
                                  log(controller.selectedPaymentMethod.value);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.addTracker(
                                  MyFormatDateUtils.dateEEEEddMMMMyyyy(
                                          date: controller.setDay)
                                      .toString(),
                                  data["name"],
                                  controller.selectedPaymentMethod.value,
                                  data["specialist"],
                                  user!.uid.toString(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff004AAD),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
