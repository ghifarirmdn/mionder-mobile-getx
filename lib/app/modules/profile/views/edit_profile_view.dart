import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/button.dart';
import 'package:mionder_mobile_get/app/shared/widgets/form_input.dart';
import 'package:mionder_mobile_get/app/shared/widgets/label_form.dart';

import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final nameController = TextEditingController();
    RxBool isLoading = false.obs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              controller.pickImage();
            },
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor,
                          width: 2,
                        ),
                      ),
                      child: user?.photoURL == null
                          ? AppImage.png('user')
                          : Image.file(
                              File(user!.photoURL.toString()),
                            ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                const Text(
                  "Put your best profile picture!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const LabelForm(text: "New Name"),
          MyFormInput(
            hintText: 'Enter your new name',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: AppImage.svg(
                'ic-profile',
                color: black400,
              ),
            ),
            controller: nameController,
          ),
          const SizedBox(height: 10),
          Obx(
            () => MyButton(
              color: const Color(0xff004AAD),
              onTap: () {
                isLoading.value = true;
                controller.updateName(nameController.text);
                isLoading.value = false;
              },
              child: isLoading.value == true
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Text(
                      "Save",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 250, 176),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
