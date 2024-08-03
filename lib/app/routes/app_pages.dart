// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:graduation/app/modules/add_new_section/add_new_section_binding.dart';
import 'package:graduation/app/modules/add_new_section/add_new_section_view.dart';
import 'package:graduation/app/modules/auth/add_new_employee/binding/add_new_employee_binding.dart';
import 'package:graduation/app/modules/auth/add_new_employee/view/add_new_employee_view.dart';
import 'package:graduation/app/modules/auth/reset_password/reset_password_binding/reset_password_binding.dart';
import 'package:graduation/app/modules/auth/reset_password/view/reset_password_view.dart';
import 'package:graduation/app/modules/auth/verification/verification_binding/verification_binding.dart';
import 'package:graduation/app/modules/auth/verification/verification_view/verification_view.dart';
import 'package:graduation/app/modules/document_details/bindings/document_details_binding.dart';
import 'package:graduation/app/modules/document_details/view/document_details_view.dart';

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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWEMP,
      page: () => AddNewEmployeeView(),
      binding: AddNewEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWSECTION,
      page: () => AddNewSectionView(),
      binding: AddNewSectionBinding(),
    ),
    GetPage(
      name: _Paths.VERIFI,
      page: () => VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENTDETAILS,
      page: () => DocumentDetailsView(),
      binding: DocumentDetailsBinding(),
    ),
  ];
}
