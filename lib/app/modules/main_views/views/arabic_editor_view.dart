import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/main_views/controllers/arabic_editor_controller.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_dropdown.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class ArabicEditorView extends GetView<ArabicEditorController> {
  @override
  ArabicEditorController controller = Get.put(ArabicEditorController());
  ArabicEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBlue.withOpacity(0.1),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 0.22.sh,
                child: QuillToolbar.simple(
                  configurations: QuillSimpleToolbarConfigurations(
                    showDirection: true,
                    controller: controller.arabicQuillController,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('ar'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.02.sh),
                child: QuillEditor(
                  configurations: QuillEditorConfigurations(
                      padding: EdgeInsetsDirectional.only(end: 0.02.sw),
                      maxHeight: 1.sh,
                      minHeight: 1.sh,
                      controller: controller.arabicQuillController,
                      autoFocus: true,
                      checkBoxReadOnly: true,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('ar'),
                      ),
                      builder: (context, quillEditor) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppColors.secondBlue,
                              border: Border.all(color: AppColors.mainBlue)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw, vertical: 0.02.sh),
                          // Your background color
                          child: SingleChildScrollView(
                              child:
                                  quillEditor), // Render the Quill editor within the container
                        );
                      }),
                  focusNode: FocusNode(),
                  scrollController: controller.arabicScrollController,
                ),
              ),
            ],
          ),
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.04.sw, vertical: 0.02.sh),
                child: FloatingActionButton(
                    backgroundColor: AppColors.mainBlue.withOpacity(0.8),
                    onPressed: () async {
                      if (controller.arabicQuillController.plainTextEditingValue
                          .text.isNotEmpty) {
                        await submitionDialog();
                      } else {
                        CustomToast.showMessage(
                            message: 'أدخل النص أولا',
                            messagetype: MessageType.showInfo);
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: AppColors.whiteColor,
                    )),
              ))
        ],
      ),
    );
  }

  Future<void> submitionDialog() async {
    controller.departmentController.clear();
    controller.dataController.clear();
    controller.requiredDepartments.clear();
    controller.dataList.clear();
    await Get.defaultDialog(
        backgroundColor: AppColors.whiteColor,
        title: 'اكمل معلومات الإدخال',
        content: SizedBox(
          width: 1.sw,
          height: 0.4.sh,
          child: Column(
            children: [
              Row(
                children: [
                  StaticCustomDrop(
                      onChanged: () {
                        if (controller.requiredDataName.value.isNotEmpty) {
                          if (!controller.dataList
                              .contains(controller.requiredDataName.value)) {
                            controller.dataList
                                .add(controller.requiredDataName.value);
                          }
                        }
                      },
                      textName: controller.requiredDataName,
                      selectedValue: controller.selectedData,
                      itemList: controller.requiredDataList),
                ],
              ),
              Obx(() => SizedBox(
                    height: 0.07.sh,
                    child: ListView.builder(
                        itemCount: controller.dataList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 0.008.sw, vertical: 0.01.sh),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.02.sw, vertical: 0.01.sh),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: AppColors.mainBlue)),
                            child: CustomText(
                                textType: TextStyleType.body,
                                text: controller.dataList[index]),
                          );
                        }),
                  )),
              Row(
                children: [
                  StaticCustomDrop(
                      onChanged: () {
                        if (controller.departmentName.value.isNotEmpty) {
                          if (!controller.requiredDepartments
                              .contains(controller.departmentName.value)) {
                            controller.requiredDepartments
                                .add(controller.departmentName.value);
                          }
                        }
                      },
                      textName: controller.departmentName,
                      selectedValue: controller.selectedDepartmen,
                      itemList: controller.itemsList),
                ],
              ),
              Obx(() => SizedBox(
                    height: 0.07.sh,
                    child: ListView.builder(
                        itemCount: controller.requiredDepartments.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 0.008.sw, vertical: 0.01.sh),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.02.sw, vertical: 0.01.sh),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: AppColors.mainBlue)),
                            child: CustomText(
                                textType: TextStyleType.body,
                                text: controller.requiredDepartments[index]),
                          );
                        }),
                  )),
              0.03.sh.ph,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 0.07 .sw),
                child: Row(
                  children: [
                    CustomButton(
                      text: 'تأكيد',
                      onPressed: () async {
                        await controller.createTemplate();
                      },
                    ),
                    0.01.sw.pw,
                     CustomButton(
                      text: 'حذف الكل',
                      onPressed: ()  {
                        controller.dataList.clear();
                        controller.requiredDepartments.clear();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
