import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/enums/file_type_enum.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/document_details/controller/document_details_controller.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_date_picker.dart';
import 'package:graduation/global/custom_widgets/custom_dropdown.dart';
import 'package:graduation/global/custom_widgets/custom_gradient_container.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class DocumentDetailsView extends GetView<DocumentDetailsController> {
  DocumentDetailsView({super.key});
  @override
  DocumentDetailsController controller = Get.put(DocumentDetailsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            CustomGradientContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.03.sw, vertical: 0.02.sh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 0.08.sw,
                          ),
                        ),
                        0.07.sw.pw,
                        CustomText(
                          textType: TextStyleType.subTitle,
                          text: '',
                          textColor: AppColors.mainBlue,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                    0.03.sh.ph,
                    Material(
                      elevation: 9.r,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        width: 0.95.sw,
                        height: 0.85.sh,
                        decoration: BoxDecoration(
                            color: AppColors.glassColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.03.sw, vertical: 0.03.sh),
                          child: ListView(
                            children: [
                              detailsInfo(
                                  controller: controller.employeeController,
                                  text: 'رقم الطلب'),
                              SizedBox(
                                width: 0.9.sw,
                                height: 50 *
                                    controller.document!.list!.length
                                        .toDouble(),
                                child: ListView.builder(
                                    primary: false,
                                    itemCount:
                                        controller.document!.list!.length,
                                    itemBuilder: (context, index) {
                                      
                                      return detailsInfo(
                                          controller:
                                              controller.controllersList[index],
                                          text: controller
                                              .document!.list![index]);
                                    }),
                              ),
                              0.01.sh.ph,
                              StaticCustomDrop(
                                  textName: controller.userName,
                                  selectedValue: controller.selectedUser,
                                  itemList: controller.itemsList),
                              0.01.sh.ph,
                              CustomDatePicker(
                                  controller: controller.dateController,
                                  hintText: 'تاريخ الطلب',
                                  pickFirst: true),
                              0.01.sh.ph,
                              const CustomText(
                                  textType: TextStyleType.body,
                                  text: 'المرفقات:'),
                              0.008.sh.ph,
                              Obx(() => SizedBox(
                                    width: 0.95.sw,
                                    height: 0.54.sh,
                                    child: AnimationLimiter(
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        primary: false,
                                        padding: EdgeInsets.all(0.01.sw),
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.w,
                                        mainAxisSpacing: 0.005.sw,
                                        crossAxisSpacing: 0.005.sw,
                                        children: List.generate(
                                          controller.imageList.length + 1,
                                          (int index) {
                                            return AnimationConfiguration
                                                .staggeredGrid(
                                                    position: index,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    columnCount: 3,
                                                    child: ScaleAnimation(
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      curve: Curves
                                                          .fastLinearToSlowEaseIn,
                                                      child: FadeInAnimation(
                                                          child: index == 0
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await cameraOnPressedAction();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        0.1.sw,
                                                                    height:
                                                                        0.1.sw,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .mainBlue
                                                                            .withOpacity(
                                                                                0.6),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.r)),
                                                                    child: Icon(
                                                                        Icons
                                                                            .add_a_photo,
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                        size: 0.08
                                                                            .sw),
                                                                  ),
                                                                )
                                                              : Stack(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          0.3.sh,
                                                                      width: 0.4
                                                                          .sw,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10.r)),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          await Get.defaultDialog(
                                                                              title: 'الصورة رقم $index',
                                                                              content: SizedBox(
                                                                                width: 0.8.sw,
                                                                                height: 0.5.sh,
                                                                                child: Image.file(
                                                                                  File(controller.imageList[index - 1]),
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ));
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.r),
                                                                          child:
                                                                              Image.file(
                                                                            File(controller.imageList[index -
                                                                                1]),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            controller.imageList.removeAt(index -
                                                                                1);
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove_circle,
                                                                            color:
                                                                                AppColors.redColor,
                                                                          ),
                                                                        ))
                                                                  ],
                                                                )),
                                                    ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0.01.sh),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: AnimatedBuilder(
                  animation: controller.animationController!,
                  builder: (context, child) {
                    return Container(
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: const CircleBorder(),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          8.0 * controller.animationController!.value,
                        ),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await controller.sendTask();
                      },
                      color: Colors.blue,
                      icon: const Icon(
                        Icons.send,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailsInfo({
    required String text,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        CustomText(textType: TextStyleType.body, text: "$text :"),
        const Spacer(),
        CustomTextForm(
          fieldheight: 40,
          fieldWidth: 200,
          controller: controller,
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
          validator: (value) => (value!.isEmpty) ? 'هذا الحقل مطلوب' : null,
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }

  Future<void> cameraOnPressedAction() async {
    await Get.defaultDialog(
        title: 'اخيار مرفق:',
        titleStyle: TextStyle(color: AppColors.mainBlue),
        content: SizedBox(
          width: 1.sw,
          height: 0.07.sh,
          child: Row(
            children: [
              CustomButton(
                text: 'الكاميرا',
                onPressed: () async {
                  await controller
                      .pickFile(type: FileTypeEnum.camera)
                      .then((value) => controller.imageList.add(value.path[0]));
                  Get.back();
                },
                width: 80.w,
              ),
              0.02.sw.pw,
              CustomButton(
                text: 'معرض الصور',
                onPressed: () async {
                  await controller
                      .pickFile(type: FileTypeEnum.gallery, allowMultiple: true)
                      .then((value) => controller.imageList.addAll(value.path));
                  Get.back();
                },
                width: 80.w,
              ),
              0.02.sw.pw,
              CustomButton(
                text: 'الملفات',
                onPressed: () async {
                  await controller
                      .pickFile(type: FileTypeEnum.file, allowMultiple: true)
                      .then((value) => controller.imageList.addAll(value.path));
                  Get.back();
                },
                width: 80.w,
              ),
            ],
          ),
        ));
  }
}
