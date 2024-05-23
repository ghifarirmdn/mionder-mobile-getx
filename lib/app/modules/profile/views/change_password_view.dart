import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/modules/profile/controllers/profile_controller.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/button.dart';
import 'package:mionder_mobile_get/app/shared/widgets/form_input.dart';
import 'package:mionder_mobile_get/app/shared/widgets/label_form.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    RxBool isLoading = false.obs;

    final newPasswordController = TextEditingController();
    final newpasswordConfirmationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const LabelForm(text: "New Password"),
            Obx(
              () => MyFormInput(
                hintText: 'enter your new password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppImage.svg(
                    'ic-password',
                    color: black400,
                  ),
                ),
                controller: newPasswordController,
                obscureText: profileController.isVisible.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    profileController.isVisible.value =
                        !profileController.isVisible.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: AppImage.svg(
                      profileController.isVisible.value
                          ? 'ic-eye-off'
                          : 'ic-eye',
                      color: profileController.isVisible.value
                          ? black200
                          : primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const LabelForm(text: "New Password Confirmation"),
            Obx(
              () => MyFormInput(
                hintText: 'confirm your new password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppImage.svg(
                    'ic-password',
                    color: black400,
                  ),
                ),
                controller: newpasswordConfirmationController,
                obscureText: profileController.isVisible.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    profileController.isVisible.value =
                        !profileController.isVisible.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: AppImage.svg(
                      profileController.isVisible.value
                          ? 'ic-eye-off'
                          : 'ic-eye',
                      color: profileController.isVisible.value
                          ? black200
                          : primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => MyButton(
                color: primaryColor,
                onTap: () {
                  isLoading.value = true;
                  profileController.updatePassword(
                    newPasswordController.text,
                    newpasswordConfirmationController.text,
                  );
                  isLoading.value = false;
                },
                child: isLoading.value == true
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      )
                    : const Text(
                        "Update Password",
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
      ),
    );
  }
}
