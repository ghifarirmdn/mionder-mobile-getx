import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/routes/app_pages.dart';

import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  const ReservationView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ReservationController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Reservation",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.getDoctor(),
              builder: (context, snapshot) {
                final listDoctor = snapshot.data!.docs;
                if (snapshot.connectionState == ConnectionState.active) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listDoctor.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        height: 175,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 250, 176),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.document_scanner_rounded,
                                  color: Color(0xff004AAD),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${(listDoctor[index].data() as Map<String, dynamic>)["name"]}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff004AAD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${(listDoctor[index].data() as Map<String, dynamic>)["specialist"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xff004AAD),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${(listDoctor[index].data() as Map<String, dynamic>)["experience"]} years",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff004AAD),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Column(
                              children: [
                                const SizedBox(width: 15),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            const Color(0xff004AAD)),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(
                                      Routes.CONSULTAN_CALL,
                                      arguments: listDoctor[index].id,
                                    );
                                  },
                                  child: const Text(
                                    "Boook Now",
                                    style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 255, 250, 176), // Warna teks
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
