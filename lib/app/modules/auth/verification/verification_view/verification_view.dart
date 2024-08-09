import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/modules/auth/verification/verification_controller/verification_controller.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_button.dart';
import 'package:graduation/global/shared/app_colors.dart';
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
        body: CustomAppLayout(
            forWardWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.08.sh),
          child: Column(children: [
            verificationWidget(),
            const Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 0.16.sw),
              child: Row(
                children: [
                  CustomText(
                      textType: TextStyleType.small,
                      textColor: AppColors.mainDark,
                      text: " لم يتم استلام الرمز؟"),
                  CustomTextButton(text: "إعادة الإرسال", onPressed: () {})
                ],
              ),
            )
          ]),
        )));
  }

  Widget verificationWidget() {
    return PinCodeTextField(
      appContext: Get.context!,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: AppColors.mainBlue,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: AppColors.whiteColor,
          selectedFillColor: AppColors.whiteColor,
          inactiveFillColor: AppColors.whiteColor,
          selectedColor: AppColors.mainBlue,
          activeColor: AppColors.mainBlue,
          inactiveColor: AppColors.mainBlue,
          errorBorderColor: AppColors.redColor),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      errorAnimationController: controller.errorAnimationController,
      controller: controller.pinController,
      onCompleted: (v) {
        Get.toNamed(Routes.MAINVIEW);
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
