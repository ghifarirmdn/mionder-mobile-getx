import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/modules/auth/controllers/auth_controller.dart';
import 'package:mionder_mobile_get/app/utils/loading.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            log(snapshot.data.toString());
            return GetMaterialApp(
              title: "Application",
              debugShowCheckedModeBanner: false,
              initialRoute:
                  snapshot.data != null ? Routes.NAVIGATION : Routes.LOGIN,
              // home: snapshot.data != null ? NavigationView() : LoginView(),
              getPages: AppPages.routes,
            );
          }
          return const LoadingView();
        });
  }
}
