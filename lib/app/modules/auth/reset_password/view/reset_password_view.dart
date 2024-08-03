import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/auth/reset_password/controller/reset_password_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  ResetPasswordController controller = Get.put(ResetPasswordController());
  ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppLayout(
      forWardWidget: registerationWidget(),
      mainIcon: Icon(
        Icons.edit_document,
        color: AppColors.whiteColor,
        size: 0.3.sw,
      ),
    ));
  }

  Widget registerationWidget() {
    return Form(
        child: Center(
      child: Column(
        children: [
          SizedBox(
            width: 0.02.sh,
            height: 0.07.sh,
          ),
          CustomText(
            textType: TextStyleType.small,
            text: 'الرجاء إخال بريدك الألكتروني لاستلام رمز التحقق',
            textColor: AppColors.secondDark,
          ),
          0.07.sh.ph,
          CustomTextForm(
            controller: controller.emailController,
            hint: 'example@gmail.com',
            sufexIcon: Icon(Icons.email, color: AppColors.secondDark),
            keyboardType: TextInputType.emailAddress,
          ),
          0.07.sh.ph,
          CustomButton(
              text: 'إرسال',
              onPressed: () {
                controller.fakeSending();
              }),
        ],
      ),
    ));
  }
}
