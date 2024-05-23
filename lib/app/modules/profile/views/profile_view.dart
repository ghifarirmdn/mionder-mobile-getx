import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/modules/auth/controllers/auth_controller.dart';
import 'package:mionder_mobile_get/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final navigationController = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("My Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 35,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          user!.displayName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          user.email.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.EDIT_PROFILE);
                  },
                  child: const Icon(
                    Icons.edit_sharp,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          const Text("Account"),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              navigationController.changeTabIndex(1);
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.note_alt_outlined),
                SizedBox(width: 10),
                Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(0.5),
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.NOTIFICATION);
                },
                child: const Row(
                  children: [
                    Icon(Icons.notifications_active_outlined),
                    SizedBox(width: 10),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(0.5),
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              authController.logout();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: const Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 10),
                Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
