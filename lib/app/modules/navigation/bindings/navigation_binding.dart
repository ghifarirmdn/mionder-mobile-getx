import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/modules/social/controllers/social_controller.dart';
import 'package:mionder_mobile_get/app/modules/tracker/controllers/tracker_controller.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<SocialController>(
      () => SocialController(),
    );
    Get.lazyPut<TrackerController>(
      () => TrackerController(),
    );
  }
}
