// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/auth/add_new_employee/controller/add_new_employee_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class AddNewEmployeeView extends GetView<AddNewEmployeeController> {
  @override
  AddNewEmployeeController controller = Get.put(AddNewEmployeeController());

  AddNewEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppLayout(
      forWardWidget: registerationWidget(),
      height: 450.h,
    ));
  }

  Widget registerationWidget() {
    return Form(
      key: controller.formKey,
      child: ListView(
        children: [
          SizedBox(
            width: 1.sw,
            height: 0.53.sh,
            child: Column(
              children: [
                CustomTextForm(
                  controller: controller.emailController,
                  hint: 'البريد الالكتروني',
                  validator: (value) =>
                      (value!.isEmpty) ? 'البريد اللكتروني غير صالح' : null,
                  sufexIcon: Icon(Icons.email, color: AppColors.secondDark),
                  keyboardType: TextInputType.emailAddress,
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.nameController,
                  hint: 'الاسم',
                  validator: (value) =>
                      (value!.isEmpty) ? 'الاسم غير صالح' : null,
                  sufexIcon: Icon(Icons.person, color: AppColors.secondDark),
                  keyboardType: TextInputType.visiblePassword,
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.departmentController,
                  hint: 'القسم',
                  validator: (value) =>
                      (value!.isEmpty) ? 'هذ الحقل مطلوب' : null,
                  sufexIcon: Icon(Icons.document_scanner_rounded,
                      color: AppColors.secondDark),
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.genderController,
                  hint: 'الجنس',
                  validator: (value) =>
                      (value!.isEmpty) ? 'هذا الحقل مطلوب' : null,
                  sufexIcon: Icon(Icons.person_4_outlined,
                      color: AppColors.secondDark),
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.passwordController,
                  hint: 'كلمة المرور',
                  validator: (value) =>
                      (value!.isEmpty) ? 'كلمة المرور غير صالحة' : null,
                  sufexIcon: Icon(Icons.password, color: AppColors.secondDark),
                  keyboardType: TextInputType.visiblePassword,
                ),
                0.015.sh.ph,
                CustomButton(
                  text: 'إضافة',
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.fakeSignUp();
                    }
                  },
                ),
                // const Spacer(),
                // Padding(
                //   padding: EdgeInsetsDirectional.only(start: 0.2.sw),
                //   child: Row(
                //     children: [
                //       CustomText(
                //           textType: TextStyleType.small,
                //           textColor: AppColors.mainDark,
                //           text: "Allredy have an account?"),
                //       CustomTextButton(
                //           text: "Log In",
                //           onPressed: () {
                //             Get.to(LoginView());
                //           })
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
