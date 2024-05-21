import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mionder_mobile_get/app/modules/social/views/add_comment_view.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';

import '../controllers/social_controller.dart';

class SocialView extends GetView<SocialController> {
  const SocialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Reviews",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                StreamBuilder<QuerySnapshot<Object?>>(
                  stream: controller.getReviews(),
                  builder: (context, snapshot) {
                    final listReviews = snapshot.data!.docs;
                    if (snapshot.connectionState == ConnectionState.active) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listReviews.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 250, 176),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${(listReviews[index].data() as Map<String, dynamic>)["name"]}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "${(listReviews[index].data() as Map<String, dynamic>)["comment"]}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddCommentView(),
              ));
        },
        backgroundColor: const Color(0xff004AAD),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
