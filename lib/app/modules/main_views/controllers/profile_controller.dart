import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/repositories/auth_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class ProfileController extends BaseController {
  RxString profileImage = ''.obs;
  TextEditingController emailController = TextEditingController();
  RxBool openDrawer = false.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void onInit() {
    nameController.text=prefStorage.getLoginModel()!.name??'';
    emailController.text=prefStorage.getLoginModel()!.email??'';
    super.onInit();
  }
  void fakeUpdating() {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        profileImage.value.isEmpty) {
      CustomToast.showMessage(
          message: 'please update something',
          messagetype: MessageType.showInfo);
    } else {
      runFullLoadingFutureFunction(
          function: AuthRepository()
              .editInfo(
                  id: prefStorage.getLoginModel()!.id!,
                  userName: nameController.text,
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) {
        if (value.$1 != null) {
          CustomToast.showMessage(
              message: value.$1!, messagetype: MessageType.rejected);
        } else if (value.$2 != null) {
          CustomToast.showMessage(
              message: value.$2!.message!, messagetype: MessageType.success);
        }
      }));
    }
  }
}
