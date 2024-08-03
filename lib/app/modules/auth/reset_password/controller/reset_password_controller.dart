import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/app/routes/app_pages.dart';

class ResetPasswordController extends BaseController {
  final TextEditingController emailController = TextEditingController(text: '');
  GlobalKey<FormState> globalKey = GlobalKey();

  Future<void> fakeSending() async {
    await runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => Get.toNamed(Routes.VERIFI)));
  }
}
