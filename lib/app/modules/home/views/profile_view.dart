import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/enums/file_type_enum.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/home/controllers/profile_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_layout.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
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
    return CustomAppLayout(
        color: AppColors.secondDark.withOpacity(0.45),
        mainIcon: Center(
          child: SizedBox(
            width: 0.5.sw,
            child: Stack(
              children: [
                Obx(() => Padding(
                      padding: EdgeInsetsDirectional.only(start: 0.05.sw),
                      child: Container(
                        width: 0.4.sw,
                        height: 0.5.sw,
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
              hint: 'Name',
              keyboardType: TextInputType.name,
            ),
            0.01.sh.ph,
            CustomTextForm(
              controller: controller.emailController,
              hint: 'user email',
              sufexIcon: Icon(Icons.email, color: AppColors.secondDark),
              keyboardType: TextInputType.emailAddress,
            ),
            0.01.sh.ph,
            CustomTextForm(
              controller: controller.departmentController,
              hint: 'department',
              keyboardType: TextInputType.emailAddress,
            ),
            0.03.sh.ph,
            CustomButton(
              text: 'Update',
              onPressed: () {
                controller.fakeUpdating();
              },
            ),
            0.01.sh.ph,
            Obx(() => Text(controller.errorMessage.value))
          ],
        ));
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
        title: 'are you sure to delete your photo',
        titleStyle: TextStyle(color: AppColors.mainBlue, fontSize: 15.sp),
        content: SizedBox(
          width: 1.sw,
          height: 0.07.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: Row(
              children: [
                CustomButton(
                  text: 'Cancel',
                  textFontWeight: FontWeight.w600,
                  onPressed: () {
                    Get.back();
                  },
                  backgroundColor: AppColors.whiteColor,
                  textColor: AppColors.mainBlue,
                ),
                0.02.sw.pw,
                CustomButton(
                  text: 'OK',
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
}
