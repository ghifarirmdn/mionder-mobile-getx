import 'package:get/get.dart';
import 'package:mionder_mobile_get/app/modules/profile/views/change_password_view.dart';
import 'package:mionder_mobile_get/app/modules/auth/views/register_view.dart';
import 'package:mionder_mobile_get/app/modules/reservation/views/consultan_call_view.dart';
import 'package:mionder_mobile_get/app/modules/social/views/add_comment_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/edit_profile_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/social/bindings/social_binding.dart';
import '../modules/social/views/social_view.dart';
import '../modules/tracker/bindings/tracker_binding.dart';
import '../modules/tracker/views/tracker_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.TRACKER,
      page: () => const TrackerView(),
      binding: TrackerBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION,
      page: () => const ReservationView(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL,
      page: () => const SocialView(),
      binding: SocialBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTAN_CALL,
      page: () => const ConsultanCallView(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COMMENT,
      page: () => const AddCommentView(),
      binding: SocialBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ProfileBinding(),
    ),
  ];
}
