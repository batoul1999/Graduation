import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/core/string_util.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/frames_custom_painter/sign_up_frame.dart';
import 'package:graduation/ui/home_page/home_page.dart';
import 'package:graduation/ui/home_view/home_view.dart';
import 'package:graduation/ui/login_view/login_view.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_button.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_field.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_text.dart';
import 'package:graduation/ui/sign_up_view/sign_up_controller.dart';

// ignore: must_be_immutable
class SignUpView extends GetView<SignUpController> {
  SignUpController controller = Get.put(SignUpController());
  final GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          key: SignUpFormKey,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 500),
              child: CustomPaint(
                size: Size(1.sw, 0.6.sh),
                painter: SignUpFrame(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 0.03.sw, vertical: 0.045.sh),
              child: Column(
                children: [
                  CustomText(
                    text: 'Sign Up',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  0.07.sh.ph,
                  InputField(
                    label: 'Email or mobile',
                    controller: controller.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email or mobile number";
                      } else if (isValidEmail(value)) {
                        // Email format is valid
                        return null;
                      } else if (isValidMobileNumber(value)) {
                        // Syrian mobile number format is valid
                        return null;
                      } else {
                        return "Please enter a valid email or Syrian mobile number";
                      }
                    },
                  ),
                  0.015.sh.ph,
                  InputField(
                    label: 'User Name',
                    controller: controller.nameController,
                    validator: (value) {
                      return value!.isEmpty || isValidName(value)
                          ? "please enter your name"
                          : null;
                    },
                  ),
                  0.015.sh.ph,
                  InputField(
                    label: 'Department',
                    controller: controller.departmentController,
                    validator: (value) {
                      return value!.isEmpty || isValidName(value)
                          ? "please enter your department"
                          : null;
                    },
                  ),
                  0.015.sh.ph,
                  InputField(
                    label: 'Password',
                    controller: controller.passwordController,
                    validator: (value) {
                      return value!.isEmpty || !isValidPassword(value)
                          ? "please enter valid password"
                          : null;
                    },
                  ),
                  0.085.sh.ph,
                  CustomButton(
                    onPressed: () {
                      if (SignUpFormKey.currentState!.validate()) {
                        Get.offAll(() => HomePage());
                      }
                    },
                    buttonText: 'Sign Up',
                  ),
                  0.03.sh.ph,
                  InkWell(
                    onTap: () {
                      Get.offAll(() => LoginView());
                    },
                    child: CustomText(
                      text: 'Allready have an account? Log In',
                      textColor: AppColors.mainColor3,
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
