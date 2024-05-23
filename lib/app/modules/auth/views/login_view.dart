import 'package:flutter/material.dart';

import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/button.dart';
import 'package:mionder_mobile_get/app/shared/widgets/form_input.dart';
import 'package:mionder_mobile_get/app/shared/widgets/label_form.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/mionder_logo.png",
                  width: 200,
                ),
                SizedBox(height: 15),
                Text(
                  'Sign In',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: black600, fontSize: 25),
                ),
                Text(
                  'Welcome Back!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: black600, fontSize: 18),
                ),
              ],
            ),
            const LabelForm(text: "Email"),
            MyFormInput(
              hintText: 'Email',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: AppImage.svg(
                  'ic-mail',
                  color: black400,
                ),
              ),
              controller: emailController,
            ),
            const LabelForm(text: "Password"),
            Obx(
              () => MyFormInput(
                hintText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppImage.svg(
                    'ic-password',
                    color: black400,
                  ),
                ),
                controller: passwordController,
                obscureText: controller.isVisible.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.isVisible.value = !controller.isVisible.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: AppImage.svg(
                      controller.isVisible.value ? 'ic-eye-off' : 'ic-eye',
                      color:
                          controller.isVisible.value ? black200 : primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => MyButton(
                color: const Color(0xff004AAD),
                onTap: () {
                  // FocusScope.of(context).unfocus();
                  // isLoading.value = true;
                  controller.login(
                    emailController.text,
                    passwordController.text,
                  );
                  // isLoading.value = false;
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
                        "Sign In",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 250, 176),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Or don't have an account?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 10),
            MyButton(
              color: primaryColor,
              onTap: () {
                Get.toNamed(Routes.REGISTER);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 250, 176),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
