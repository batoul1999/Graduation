// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/add_new_employee/controller/add_new_employee_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_dropdown.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';
import 'package:lottie/lottie.dart';

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
      mainIcon: LottieBuilder.asset('assets/lottie/add_employee.json'),
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
                  controller: controller.nameController,
                  hint: 'اسم المستخدم',
                  validator: (value) =>
                      (value!.isEmpty) ? 'الاسم غير صالح' : null,
                  sufexIcon: Icon(Icons.person, color: AppColors.secondDark),
                  keyboardType: TextInputType.visiblePassword,
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
                0.01.sh.ph,

                Obx(()=>StaticCustomDrop(
                    width: 0.93.sw,
                    textName: controller.departmentName,
                    selectedValue: controller.selectedDepartmen,
                    itemList: controller.departmentsList
                        .map((dept) => dept.name ?? 'لا يوجد اسم')
                        .toList()
                        .obs)),
                0.025.sh.ph,
                CustomButton(
                  text: 'إضافة',
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.createEmployee();
                    }
                  },
                ),
                0.03.sh.ph,
                  Visibility(
                    visible: controller.errorMessage.value.isNotEmpty,
                    child: CustomText(
                        textType: TextStyleType.small,
                        text: controller.errorMessage.value,
                        textColor: AppColors.redColor),
                  )
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
