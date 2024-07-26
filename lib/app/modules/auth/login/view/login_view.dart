// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/auth/sign_up/view/sign_up_view.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_button.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

import '../controller/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  @override
  LoginController controller = Get.put(LoginController());

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppLayout(forWardWidget: registerationWidget()));
  }

  Widget registerationWidget() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          0.1.sh.ph,
          CustomTextForm(
            controller: controller.emailController,
            hint: 'user email',
            validator: (value) =>
                (value!.isEmpty) ? 'user name is required' : null,
            sufexIcon: Icon(Icons.email, color: AppColors.secondDark),
            keyboardType: TextInputType.emailAddress,
          ),
          0.015.sh.ph,
          CustomTextForm(
            controller: controller.passwordController,
            hint: 'password',
            validator: (value) =>
                (value!.isEmpty) ? 'password is required' : null,
            sufexIcon: Icon(Icons.password, color: AppColors.secondDark),
            keyboardType: TextInputType.visiblePassword,
          ),
          0.03.sh.ph,
          CustomButton(
            text: 'Login',
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                //controller.login();
                controller.fakeLogin();
              }
            },
          ),
          0.005.sh.ph,
          CustomTextButton(
              text: "Forget password?",
              textSize: 12.sp,
              decoration: TextDecoration.none,
              onPressed: () {
                Get.toNamed(Routes.RESETPASSWORD);
              }),
          Obx(
            () => Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 0.2.sw),
            child: Row(
              children: [
                CustomText(
                    textType: TextStyleType.small,
                    textColor: AppColors.mainDark,
                    text: "Don't have an account?"),
                CustomTextButton(
                    text: "SignUp",
                    onPressed: () {
                      Get.to(SignUpView());
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
