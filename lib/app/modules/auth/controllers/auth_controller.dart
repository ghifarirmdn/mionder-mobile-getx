import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/widgets/snackbar.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  final isVisible = true.obs;

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.toNamed(Routes.NAVIGATION);
    } on FirebaseAuthException catch (e) {
      MySnakebar.failure(title: "Error!", subtitle: e.message.toString());
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      if (password != passwordConfirmation) {
        MySnakebar.failure(
          title: "Error!",
          subtitle: "Password dan password konfirmasi harus sama!",
        );
      } else {
        UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User? user = result.user;
        user?.updateDisplayName(name);
        Get.toNamed(Routes.NAVIGATION);
      }
    } on FirebaseAuthException catch (e) {
      MySnakebar.failure(title: "Error!", subtitle: e.message.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
