import 'package:flutter/material.dart';

import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';
import 'package:mionder_mobile_get/app/shared/widgets/button.dart';
import 'package:mionder_mobile_get/app/shared/widgets/form_input.dart';

import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: black600, fontSize: 25),
                ),
                Text(
                  'Create your account here!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: black600, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: MyFormInput(
                hintText: 'Name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppImage.svg(
                    'ic-mail',
                    color: black400,
                  ),
                ),
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: MyFormInput(
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
            ),
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
                color: primaryColor,
                onTap: () {
                  // FocusScope.of(context).unfocus();
                  // isLoading.value = true;
                  controller.register(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  // isLoading.value = false;
                },
                child: isLoading.value == true
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: white,),
                      )
                    : const Text(
                        "Sign Up",
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
                'or',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 10),
            MyButton(
              color: Color(0xff004AAD),
              onTap: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: const Text(
                "Sign In",
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
