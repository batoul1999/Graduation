// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/login/view/login_view.dart';
import 'package:graduation/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_button.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';



// ignore: must_be_immutable
class SignUpView extends GetView<SignUpController> {
  @override
  SignUpController controller = Get.put(SignUpController());

  SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppLayout(forWardWidget: registerationWidget()));
  }

  Widget registerationWidget() {
    return Form(
      key: controller.globalKey,
      child: Column(
        children: [
          0.03.sh.ph,
          CustomTextForm(
           // controller: controller.nameController,
            hint: 'Email or mobile',
            validator: (value) =>
                (value!.isEmpty) ? 'email or mobile number is required' : null,
            sufexIcon: Icon(Icons.email, color: AppColors.secondDark),
            keyboardType: TextInputType.emailAddress,
          ),
          0.015.sh.ph,
          CustomTextForm(
            //controller: controller.passwordController,
            hint: 'UserName',
            validator: (value) =>
                (value!.isEmpty) ? 'user name is required' : null,
            sufexIcon: Icon(Icons.person, color: AppColors.secondDark),
            keyboardType: TextInputType.visiblePassword,
          ),
              0.015.sh.ph,
          CustomTextForm(
            //controller: controller.passwordController,
            hint: 'Department',
            // validator: (value) =>
            //     (value!.isEmpty) ? 'password is required' : null,
            sufexIcon: Icon(Icons.document_scanner_rounded, color: AppColors.secondDark),
            
          ),
              0.015.sh.ph,
          CustomTextForm(
            //controller: controller.passwordController,
            hint: 'password',
            validator: (value) =>
                (value!.isEmpty) ? 'password is required' : null,
            sufexIcon: Icon(Icons.password, color: AppColors.secondDark),
            keyboardType: TextInputType.visiblePassword,
          ),
          
          0.03.sh.ph,
          CustomButton(
            text: 'Sign Up',
            onPressed: () {
              if (controller.globalKey.currentState!.validate()) {
                controller.signup();
              }
            },
          ),
       
          const Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 0.2.sw),
            child: Row(
              children: [
                CustomText(
                    textType: TextStyleType.small,
                    textColor: AppColors.mainDark,
                    text: "Allredy have an account?"),
                CustomTextButton(
                    text: "Log In",
                    onPressed: () {
                      Get.to(LoginView());
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
