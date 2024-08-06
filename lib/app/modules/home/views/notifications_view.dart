import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/home/controllers/notifications_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_bar.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/shared/app_colors.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class NotificationsView extends GetView<NotificationsController> {
  NotificationsView({super.key});
  @override
  NotificationsController controller = Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blackColor,
      onRefresh: () async {
        controller.getAllNotifications();
      },
      child: Stack(
        children: [
          Obx(() => controller.success.value == true
              ? Padding(
                  padding: EdgeInsets.only(top: 0.08.sh),
                  child: Obx(() => controller.isAllNotificationsLoading
                      ? shimmerLoading()
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.documentsList.length,
                          itemBuilder: (context, index) {
                            final notify = controller.documentsList[index];
                            return todo(notification: notify);
                          })),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 0.16.sh),
                  child: controller.errorMessage.value == ''
                      ? SpinKitCircle(
                          color: AppColors.mainBlue,
                        )
                      : CustomText(
                          textType: TextStyleType.body,
                          text: controller.errorMessage.value),
                )),
          CustomAppBar(
            text: "الإشعارات",
            onPressed: () {
              controller.documentsList.isEmpty
                  ? controller.getAllNotifications()
                  : controller.documentsList.clear();
            },
            isBool: controller.documentsList.isEmpty.obs,
          )
        ],
      ),
    );
  }

  Widget todo({required Documents notification}) {
    return Dismissible(
      key: Key(notification.name!),
      onDismissed: (direction) {
        controller.documentsList
            .removeAt(controller.documentsList.indexOf(notification.name!));
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        color: AppColors.redColor.withOpacity(0.9),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 0.05.sw),
            child: Row(
              children: [
                Icon(Icons.delete_forever, color: AppColors.whiteColor),
                0.05.sw.pw,
                CustomText(
                  textType: TextStyleType.bodyBig,
                  text: 'حذف',
                  textColor: AppColors.whiteColor,
                )
              ],
            ),
          ),
        ),
      ),
      child: Container(
        width: 1.sw,
        height: 0.145.sh,
        margin: EdgeInsetsDirectional.only(end: 0.03.sw, top: 0.01.sh),
        color: AppColors.secondBlue,
        child: Row(
          children: [
            //  Obx(() =>
            Padding(
              padding: EdgeInsetsDirectional.only(start: 0.05.sw),
              child: Container(
                width: 0.16.sw,
                height: 0.16.sw,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.mainBlue, width: 1)),
                child: notification.imageUrl == null
                    ? Icon(
                        Icons.person,
                        color: AppColors.mainBlue,
                        size: 0.1.sw,
                      )
                    : ClipOval(
                        child: Image.file(
                        File(notification.imageUrl!),
                        fit: BoxFit.cover,
                      )),
              ),
              // )
            ),
            0.03.sw.pw,
            SizedBox(
              width: 0.73.sw,
              height: 0.145.sh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  0.02.sh.ph,
                  CustomText(
                      textType: TextStyleType.body,
                      text: notification.name ?? 'لا يوجد اسم'),
                  0.005.sh.ph,
                  Text(
                    notification.description ?? 'لا يوجد وصف',
                    style: TextStyle(
                        fontSize: 12.sp,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.w300),
                  ),
                  const Spacer(),
                  CustomText(
                      textType: TextStyleType.small,
                      text: notification.issuedDate ?? 'لا يوجد بيانات')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shimmerLoading() {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: AppColors.secondBlue,
        highlightColor: AppColors.greyColor.withOpacity(0.2),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 0.005.sh),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
                width: 0.95.sw,
                height: 0.13.sh,
              );
            }));
  }
}
