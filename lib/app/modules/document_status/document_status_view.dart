import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/document_status/document_status_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_bar.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class DocumentStatusView extends GetView<DocumentStatusController> {
  DocumentStatusView({super.key});
  @override
  DocumentStatusController controller = Get.put(DocumentStatusController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          CustomAppBar(
              text: "حالة الطلب", isBool: (controller.task != null).obs),
          sectionDetails(text: "اسم الطلب: ${controller.task!.required!.template!.name??''}"),
          0.005.sh.ph,
          sectionDetails(text: "الوصف: ${controller.task!.postat!.description??'لا يوجد بيانات'}"),
          0.005.sh.ph,
          sectionDetails(text: "التاريخ: ${controller.task!.postat!.date??''}"),
          0.005.sh.ph,
          sectionDetails(
              text: "القسم الحالي: ${controller.task!.statefordept!.firstWhere((e)=>e.states=='قيد الانتظار').department!.name}"),
          0.005.sh.ph,
          sectionDetails(text: "حالة الطلب: ${controller.state??''}"),
          0.015.sh.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.015.sw),
            child: Row(
              children: [
                Container(
                  width: 0.48.sw,
                  height: 0.4.sh,
                  decoration: BoxDecoration(color: AppColors.gradientBlue),
                  child: Column(
                    children: [
                      0.01.sh.ph,
                      const CustomText(
                          textType: TextStyleType.bodyBig,
                          text: 'الأقسام المنجزة'),
                      0.01.sh.ph,
                      SizedBox(
                        height: 0.28.sh,
                        width: 0.45.sw,
                        child: ListView.builder(
                            itemCount:
                               10,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 0.4.sw,
                                height: 0.035.sh,
                                margin: EdgeInsetsDirectional.symmetric(
                                    horizontal: 0.01.sw, vertical: 0.005.sh),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: const CustomText(
                                    textType: TextStyleType.bodyBig,
                                    text: ''),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                0.01.sw.pw,
                Container(
                  width: 0.48.sw,
                  height: 0.4.sh,
                  decoration: BoxDecoration(color: AppColors.gradientBlue),
                  child: Column(
                    children: [
                      0.01.sh.ph,
                      const CustomText(
                          textType: TextStyleType.bodyBig,
                          text: 'الأقسام المتبقية'),
                      0.01.sh.ph,
                      SizedBox(
                        height: 0.28.sh,
                        width: 0.45.sw,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 0.4.sw,
                                height: 0.035.sh,
                                margin: EdgeInsetsDirectional.symmetric(
                                    horizontal: 0.01.sw, vertical: 0.005.sh),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: const CustomText(
                                    textType: TextStyleType.bodyBig,
                                    text: ''),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget sectionDetails({required String text}) {
    return LayoutBuilder(// Use LayoutBuilder to measure text size
        builder: (context, constraints) {
      final textSpan = TextSpan(
        text: text,
        style: TextStyle(
          // Replace with your custom style
          fontSize: 14.sp,
          fontWeight: FontWeight.w400, // Example style
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr, // Set the text direction
        maxLines: null, // Allow unlimited lines for accurate measurement
      )..layout(minWidth: 0, maxWidth: constraints.maxWidth);

      final textHeight = textPainter.height; // Get text height

      return Container(
        width: 1.sw,
        height: textHeight + 20.h, // Add padding (20.h) to the text height
        decoration: BoxDecoration(color: AppColors.gradientBlue),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Text(
            text,
            style: TextStyle(
              // Replace with your custom style
              fontSize: 14.sp,
              fontWeight: FontWeight.w400, // Example style
            ),
            overflow: TextOverflow.fade,
          ),
        ),
      );
    });
  }
}
