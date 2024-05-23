import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/modules/home/views/home_view.dart';
import 'package:mionder_mobile_get/app/modules/reservation/views/reservation_view.dart';
import 'package:mionder_mobile_get/app/modules/social/views/social_view.dart';
import 'package:mionder_mobile_get/app/modules/tracker/views/tracker_view.dart';
import 'package:mionder_mobile_get/app/routes/app_pages.dart';
import 'package:mionder_mobile_get/app/shared/styles/app_colors.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  NavigationView({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffFBFBFB),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: const Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.NOTIFICATION);
                },
                child: const Icon(
                  Icons.notifications_none,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        body: GetBuilder<NavigationController>(
          builder: (_) {
            return IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeView(),
                TrackerView(),
                ReservationView(),
                SocialView(),
              ],
            );
          },
        ),
        bottomNavigationBar: GetBuilder<NavigationController>(
          builder: (_) {
            return Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: Theme.of(context).textTheme.bodySmall,
                unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
                currentIndex: controller.tabIndex,
                onTap: (index) {
                  controller.changeTabIndex(index);
                },
                backgroundColor: white,
                selectedItemColor: primaryColor,
                unselectedItemColor: black300,
                elevation: 2,
                selectedIconTheme:
                    const IconThemeData(color: Color(0xff004AAD), size: 30),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      color: controller.tabIndex == 0 ? primaryColor : black400,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.history,
                      color: controller.tabIndex == 1 ? primaryColor : black400,
                    ),
                    label: 'Tracker',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.domain_verification,
                      color: controller.tabIndex == 2 ? primaryColor : black400,
                    ),
                    label: 'Reservation',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.people_outline,
                      color: controller.tabIndex == 3 ? primaryColor : black400,
                    ),
                    label: 'Reviews',
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
