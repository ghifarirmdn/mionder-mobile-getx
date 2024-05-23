import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/widgets/snackbar.dart';

class ProfileController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;

  final isVisible = true.obs;
  File? selectedImage;

  Future<void> updateName(String name) async {
    try {
      if (user != null) {
        await user?.updateDisplayName(name);
        Get.toNamed(Routes.NAVIGATION);
        MySnakebar.success(
          title: "Success!",
          subtitle: "Success updating your profile!",
        );
      }
    } on FirebaseAuthException catch (e) {
      MySnakebar.failure(
        title: "Error!",
        subtitle: e.message.toString(),
      );
    }
  }

  Future<void> updatePassword(
    String newPassword,
    String newPasswordConfirmation,
  ) async {
    if (newPassword != newPasswordConfirmation) {
      MySnakebar.failure(
        title: "Error!",
        subtitle: "New password and password confirmation must same!",
      );
    } else {
      try {
        if (user != null) {
          await user?.updatePassword(newPassword);
          Get.back();
          MySnakebar.success(
            title: "Success!",
            subtitle: "Success updating your password!",
          );
        }
      } on FirebaseAuthException catch (e) {
        MySnakebar.failure(
          title: "Error!",
          subtitle: e.message.toString(),
        );
      }
    }
  }

  Future pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        log(selectedImage.toString());
        await uploadPhoto(selectedImage!);
        MySnakebar.success(
          title: "Success!",
          subtitle: "Success updating your photo!",
        );
        update();
        Get.toNamed(Routes.NAVIGATION);
        // return selectedImage;
      }
    } catch (e) {
      MySnakebar.success(
        title: "Error!",
        subtitle: e.toString(),
      );
    }
  }

  Future<bool> uploadPhoto(File file) async {
    try {
      await user?.updatePhotoURL(file.path);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
