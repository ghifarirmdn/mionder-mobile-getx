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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            Text(
              'Masuk',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: black600, fontSize: 24),
            ),
            Text(
              'Selamat datang kembali!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: black600),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: MyFormInput(
                hintText: 'Masukkan nama anda',
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
                hintText: 'Masukkan Email',
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
                hintText: 'Masukkan Password',
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
                        child: CircularProgressIndicator(color: white),
                      )
                    : const Text(
                        "Daftar",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Atau',
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
                "Masuk",
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
    );
  }
}
