import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tracker_controller.dart';

// class Schedule {
//   String name, profession, jadwal, jam, result;
//   Schedule({
//     required this.name,
//     required this.profession,
//     required this.jadwal,
//     required this.jam,
//     required this.result,
//   });
// }

// List<Schedule> scheduleList = [
//   Schedule(
//       name: "Mark Lee, S.Psi., M.Psi., Psikolog",
//       profession: "Psychologist",
//       jadwal: "Thursday, 1st February 2024",
//       jam: "09.00",
//       result: "Result"),
//   Schedule(
//       name: "dr. Lee Jeno, Sp.KJ",
//       profession: "Psychiatrist",
//       jadwal: "Friday, 1st March 2024",
//       jam: "10.00",
//       result: "Result"),
//   Schedule(
//       name: "Na Jaemin, S.Psi., M.Psi., Psikolog",
//       profession: "Psychologist",
//       jadwal: "Monday, 2nd January 2024",
//       jam: "09.00",
//       result: "Result"),
//   Schedule(
//       name: "dr. Huang Renjun, Sp.KJ",
//       profession: "Psychiatrist",
//       jadwal: "Tuesday, 1st December 2023",
//       jam: "10.00",
//       result: "Result"),
// ];

class TrackerView extends GetView<TrackerController> {
  const TrackerView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: controller.getTracker(),
      builder: (context, snapshot) {
        final listTracker = snapshot.data!.docs;
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Tracker",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listTracker.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          height: 165,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${(listTracker[index].data() as Map<String, dynamic>)["doctor_name"]}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff004AAD),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${(listTracker[index].data() as Map<String, dynamic>)["specialist"]}",
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
                                        "${(listTracker[index].data() as Map<String, dynamic>)["date"]}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff004AAD),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.attach_money_outlined,
                                    color: Color(0xff004AAD),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${(listTracker[index].data() as Map<String, dynamic>)["payment"]}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff004AAD),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
