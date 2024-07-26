import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/app/modules/auth/verification/verification_controller/verification_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class VerificationView extends GetView<VerificationController> {
  VerificationView({super.key});
  @override
  VerificationController controller = Get.put(VerificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomAppLayout(forWardWidget: verificationWidget()));
  }

  Widget verificationWidget() {
    return PinCodeTextField(
      appContext: Get.context!,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      errorAnimationController: controller.errorAnimationController,
      controller: controller.pinController,
      onCompleted: (v) {
      //  print("Completed");
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
