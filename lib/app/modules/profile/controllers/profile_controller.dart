import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/widgets/snackbar.dart';

class ProfileController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;

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
}
