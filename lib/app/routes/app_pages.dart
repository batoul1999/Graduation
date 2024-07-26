// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:graduation/app/modules/auth/verification/verification_view/verification_view.dart';
import 'package:graduation/app/modules/home/bindings/profile_binding.dart';
import 'package:graduation/app/modules/home/bindings/verification_binding.dart';
import 'package:graduation/app/modules/home/views/profile_view.dart';

import '../modules/auth/login/binding/login_binding.dart';
import '../modules/auth/login/view/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFI,
      page: () => VerificationView(),
      binding: VerificationBinding(),
    ),
  ];
}
