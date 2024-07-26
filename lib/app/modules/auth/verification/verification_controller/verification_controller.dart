import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/app/core/services/notifications_service.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationController extends BaseController {
  StreamController<ErrorAnimationType> errorAnimationController =
      StreamController();
  TextEditingController pinController = TextEditingController();

  String pinCode = '552251';

  @override
  void onInit() {
    onRecieveCode();
    super.onInit();
  }

  void fakeVerify() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => Get.toNamed(Routes.HOME)));
  }

  void onRecieveCode() {
    Future.delayed(const Duration(seconds: 4)).then((v) =>
        NotificationsService.showNotification(
            title: 'PIN code is ready',
            body: pinCode,
            actionButtons: [
              NotificationActionButton(key: 'Dimiss', label: 'Dimiss'),
              NotificationActionButton(key: 'OK', label: 'OK'),
            ]).then((v1) => pinController.text = pinCode));
  }
}
