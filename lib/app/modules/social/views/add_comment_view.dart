import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/button.dart';
import 'package:mionder_mobile_get/app/shared/widgets/form_input.dart';

import '../controllers/social_controller.dart';

class AddCommentView extends GetView<SocialController> {
  const AddCommentView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SocialController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Comment"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyFormInput(
                  hintText: 'Enter your name',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.person),
                  ),
                  controller: controller.nameController,
                ),
                const SizedBox(height: 20),
                MyFormInput(
                  hintText: 'Enter your comment',
                  maxLines: 3,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.comment),
                  ),
                  controller: controller.commentController,
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () {
                    controller.addReviews(
                      controller.nameController.text,
                      controller.commentController.text,
                    );
                  },
                  color: primaryColor,
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
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
