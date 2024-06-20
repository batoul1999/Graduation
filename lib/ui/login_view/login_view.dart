import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/core/string_util.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/frames_custom_painter/bottom_frame.dart';
import 'package:graduation/ui/frames_custom_painter/top_frame.dart';
import 'package:graduation/ui/home_page/home_page.dart';
import 'package:graduation/ui/login_view/login_controller.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_button.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_field.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_text.dart';
import 'package:graduation/ui/sign_up_view/sign_up_view.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: loginFormKey,
          child: Stack(children: [
            CustomPaint(
              size: Size(1.sw, 0.6.sh),
              painter: TopFrame(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.435.sh),
              child: CustomPaint(
                size: Size(1.sw, 0.6.sh),
                painter: BottomFrame(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 0.03.sw, vertical: 0.2.sh),
              child: Column(
                children: [
                  CustomText(
                    text: 'Login',
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  0.085.sh.ph,
                  InputField(
                    label: 'Email',
                    controller: controller.emailController,
                    // validator: (value) {
                    //   return value!.isEmpty || isValidEmail(value)
                    //       ? "please enter your email"
                    //       : null;
                    // },
                  ),
                  0.015.sh.ph,
                  InputField(
                    label: 'Password',
                    controller: controller.passwordController,
                    // validator: (value) {
                    //   return value!.isEmpty || !isValidPassword(value)
                    //       ? "please enter valid password"
                    //       : null;
                    // },
                  ),
                  0.085.sh.ph,
                  CustomButton(
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                       controller.login();
                      }
                    },
                    buttonText: 'Login',
                  ),
                  0.03.sh.ph,
                  InkWell(
                    onTap: () {
                      Get.offAll(()=>SignUpView());
                    },
                    child: CustomText(
                      text: 'Do Not Have An Account? Sign Up',
                      textColor: AppColors.mainColor3,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
