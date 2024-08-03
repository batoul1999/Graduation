// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/add_new_section/add_nw_section_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class AddNewSectionView extends GetView<AddNwSectionController> {
  @override
  AddNwSectionController controller = Get.put(AddNwSectionController());

  AddNewSectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppLayout(
      forWardWidget: registerationWidget(),
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
                  hint: 'الاسم',
                  validator: (value) =>
                      (value!.isEmpty) ? 'الاسم غير صالح' : null,
                  sufexIcon: Icon(Icons.person, color: AppColors.secondDark),
                  keyboardType: TextInputType.visiblePassword,
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.descriptionController,
                  hint: 'الوصف',
                  validator: (value) =>
                      (value!.isEmpty) ? 'هذ الحقل مطلوب' : null,
                  sufexIcon: Icon(Icons.document_scanner_rounded,
                      color: AppColors.secondDark),
                ),

                0.015.sh.ph,
                CustomButton(
                  text: 'إضافة',
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.fakeAdding();
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
