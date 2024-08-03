// ignore_for_file: unnecessary_overrides
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/repositories/auth_repository.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/routes/app_pages.dart';

class LoginController extends BaseController {
  final TextEditingController emailController = TextEditingController(text: '');
  GlobalKey<FormState> formKey = GlobalKey();

  void login() {
    errorMessage.value = '';
    runFullLoadingFutureFunction(
        function: AuthRepository()
            .login(
      email: emailController.text,
      password: passwordController.text,
    )
            .then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
      } else if (value.$2 != null) {
        prefStorage.setTokenInfo(value.$2!.token!);
        prefStorage.setLoginModel(value.$2!);
        prefStorage.setFirstLogin(true);
        Get.toNamed(Routes.HOME);
      }
    }));
  }

  void fakeLogin() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => Get.offAllNamed(Routes.HOME)));
  }
}
