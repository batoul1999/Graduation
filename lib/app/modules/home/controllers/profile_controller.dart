import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class ProfileController extends BaseController {
  RxString profileImage = ''.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  RxBool openDrawer = false.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void fakeUpdating() {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        departmentController.text.isEmpty &&
        profileImage.value.isEmpty) {
      CustomToast.showMessage(
          message: 'please update something',
          messagetype: MessageType.showInfo);
    } else {
      runFullLoadingFutureFunction(
          function: Future.delayed(const Duration(seconds: 3)).then((value) {
        CustomToast.showMessage(
            message: 'operation success', messagetype: MessageType.success);
      }));
    }
  }
}
