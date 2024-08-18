import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/enums/file_type_enum.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/main_views/controllers/profile_controller.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  @override
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    // final userInfo = prefStorage.getLoginModel();
    return Stack(
      children: [
        CustomAppLayout(
            color: AppColors.secondDark.withOpacity(0.45),
            mainIcon: Center(
              child: SizedBox(
                width: 0.5.sw,
                child: Stack(
                  children: [
                    Obx(() => Padding(
                          padding: EdgeInsetsDirectional.only(start: 0.05.sw),
                          child: Container(
                            width: 0.39.sw,
                            height: 0.193.sh,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                                border: Border.all(
                                    color: AppColors.mainBlue, width: 3)),
                            child: controller.profileImage.value.isEmpty
                                ? Icon(
                                    Icons.person,
                                    color: AppColors.mainBlue,
                                    size: 0.25.sw,
                                  )
                                : ClipOval(
                                    child: Image.file(
                                    File(controller.profileImage.value),
                                    fit: BoxFit.cover,
                                  )),
                          ),
                        )),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                          width: 0.16.sw,
                          height: 0.16.sw,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greyColor.withOpacity(0.85),
                              border: Border.all(
                                  color: AppColors.whiteColor, width: 3)),
                          child: Obx(
                            () => InkWell(
                              onTap: () async {
                                controller.profileImage.value.isEmpty
                                    ? await cameraOnPressedAction()
                                    : await clearOnPressedAction();
                              },
                              child: Icon(
                                controller.profileImage.value.isEmpty
                                    ? Icons.add_a_photo
                                    : Icons.clear,
                                color: controller.profileImage.value.isEmpty
                                    ? AppColors.blackColor
                                    : AppColors.redColor,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            forWardWidget: Column(
              children: [
                0.05.sh.ph,
                CustomTextForm(
                  controller: controller.nameController,
                  hint: 'الاسم',
                  keyboardType: TextInputType.name,
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.emailController,
                  hint: 'البريد الالكتروني',
                  sufexIcon: Icon(Icons.email, color: AppColors.secondDark),
                  keyboardType: TextInputType.emailAddress,
                ),
                0.01.sh.ph,
                CustomTextForm(
                  controller: controller.passwordController,
                  hint: 'القسم',
                  keyboardType: TextInputType.emailAddress,
                ),
                0.03.sh.ph,
                CustomButton(
                  text: 'تحديث',
                  onPressed: () {
                    controller.fakeUpdating();
                  },
                ),
                0.01.sh.ph,
                Obx(() => Text(controller.errorMessage.value))
              ],
            )),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 0.03.sh, start: 0.05.sw),
          child: InkWell(
              onTap: () {
                controller.openDrawer.value = true;
              },
              child: Icon(
                Icons.menu,
                size: 0.08.sw,
                color: AppColors.whiteColor,
              )),
        ),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: controller.openDrawer.value ? 0.8.sw : 0,
            height: 1.sh,
            decoration: BoxDecoration(
                color: AppColors.mainBlue.withOpacity(0.98),
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20.r),
                    bottomEnd: Radius.circular(20.r))),
            child: Visibility(
              visible: controller.openDrawer.value,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.02.sh),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: InkWell(
                        onTap: () {
                          controller.openDrawer.value = false;
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                          size: 0.08.sw,
                        ),
                      ),
                    ),
                    0.03.sh.ph,
                    customContainer(
                        function: () {
                          Get.toNamed(Routes.ADDNEWEMP);
                        },
                        text: 'إضافة موظف جديد'),
                    0.01.sh.ph,
                    customContainer(
                        function: () {
                          Get.toNamed(Routes.ADDNEWSECTION);
                        },
                        text: 'إضافة قسم جديد'),
                    0.01.sh.ph,
                    customContainer(
                        function: () {
                          Get.toNamed(Routes.AllTASKS);
                        },
                        text: 'استعراض حالة الطلب'),
                    0.01.sh.ph,
                    customContainer(
                        function: () {
                          Get.toNamed(Routes.ALLDEPARTMENTS);
                        },
                        text: 'استعراض جميع الأقسام'),    
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> cameraOnPressedAction() async {
    await Get.defaultDialog(
        title: 'take option',
        titleStyle: TextStyle(color: AppColors.mainBlue),
        content: SizedBox(
          width: 1.sw,
          height: 0.07.sh,
          child: Row(
            children: [
              CustomButton(
                text: 'Camera',
                onPressed: () async {
                  await controller.pickFile(type: FileTypeEnum.camera).then(
                      (value) => controller.profileImage.value = value.path[0]);
                  Get.back();
                },
                width: 80.w,
              ),
              0.02.sw.pw,
              CustomButton(
                text: 'Gallery',
                onPressed: () async {
                  await controller.pickFile(type: FileTypeEnum.gallery).then(
                      (value) => controller.profileImage.value = value.path[0]);
                  Get.back();
                },
                width: 80.w,
              ),
              0.02.sw.pw,
              CustomButton(
                text: 'File',
                onPressed: () async {
                  await controller.pickFile(type: FileTypeEnum.file).then(
                      (value) => controller.profileImage.value = value.path[0]);
                  Get.back();
                },
                width: 80.w,
              ),
            ],
          ),
        ));
  }

  Future<void> clearOnPressedAction() async {
    await Get.defaultDialog(
        title: 'هل أنت متأكد من حذف الصورة',
        titleStyle: TextStyle(color: AppColors.mainBlue, fontSize: 15.sp),
        content: SizedBox(
          width: 1.sw,
          height: 0.07.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: Row(
              children: [
                CustomButton(
                  text: 'الغاء',
                  textFontWeight: FontWeight.w600,
                  onPressed: () {
                    Get.back();
                  },
                  backgroundColor: AppColors.whiteColor,
                  textColor: AppColors.mainBlue,
                ),
                0.02.sw.pw,
                CustomButton(
                  text: 'تأكيد',
                  onPressed: () {
                    controller.profileImage.value = '';
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget customContainer(
      {required String text, required VoidCallback function}) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 0.75.sw,
        height: 0.07.sh,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.mainDark, width: 2),
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.whiteColor),
        child: Center(
          child: CustomText(textType: TextStyleType.body, text: text),
        ),
      ),
    );
  }
}
