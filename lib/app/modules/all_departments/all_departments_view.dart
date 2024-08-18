import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/departments_models/get_all_departments_model.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/all_departments/all_department_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_bar.dart';
import 'package:graduation/global/custom_widgets/custom_gradient_container.dart';
import 'package:graduation/global/shared/app_colors.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class AllDepartmintsView extends GetView<AllDepartmentController> {
  AllDepartmintsView({super.key});
  @override
  AllDepartmentController controller = Get.put(AllDepartmentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: RefreshIndicator(
      onRefresh: () async => await controller.loadDepartments(),
      child: CustomGradientContainer(
        child: Stack(
          children: [
            CustomAppBar(
              text: "جميع الأقسام",
              onPressed: controller.getAllDepartments,
              isBool: true.obs,
            ),
            0.1.sw.pw,
            Padding(
                padding: EdgeInsets.only(top: 0.1.sh),
                child: Obx(
                  () => controller.isAllDepartmentsLoading
                      ? shimmerLoading()
                      : ListView.builder(
                          itemCount: controller.departmentsList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                
                               await controller.getDepartmentById(id: controller.departmentsList[index].id!).then((value){
                               departmentDialog(department: controller.departmentsList[index]);
                               });
                              },
                              child: Container(
                                height: 0.1.sh,
                                width: 1.sw,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.05.sw),
                                margin: EdgeInsets.symmetric(
                                    vertical: 0.005.sh, horizontal: 0.03.sw),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.secondDark, width: 2),
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: AppColors.mainBlue.withOpacity(0.3)),
                                child: Center(
                                  child: Text(
                                    controller.departmentsList[index].name ??
                                        "لا يوجد اسم",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.secondDark,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                )),
          ],
        ),
      ),
    )));
  }

  Future<void> departmentDialog({required Departments department}) async {
    Get.defaultDialog(
        backgroundColor: AppColors.gradientBlue.withOpacity(0.95),
        title: department.name ?? 'لا يوجد اسم',
        content: SizedBox(
          width: 0.8.sw,
          height: 0.7.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                0.02.sh.ph,
                Text(
                  'الوصف:  ${department.description ?? ''}',
                  style: const TextStyle(
                      overflow: TextOverflow.fade, fontSize: 20),
                ),
                0.015.sh.ph,
                Text(
                  'عدد المهام المعلقة: ${controller.departmentModel.inProgress!.cCount!.relationDep.toString()}',
                  style: const TextStyle(
                      overflow: TextOverflow.fade, fontSize: 20),
                ),
                0.015.sh.ph,
                Text(
                  'عدد المهام المنتهية:${controller.departmentModel.accepted!.cCount!.relationDep.toString()}',
                  style: const TextStyle(
                      overflow: TextOverflow.fade, fontSize: 20),
                ),
                0.015.sh.ph,
                Text(
                  'عدد المهام المرفوضة: ${controller.departmentModel.rejected!.cCount!.relationDep.toString()}',
                  style: const TextStyle(
                      overflow: TextOverflow.fade, fontSize: 20),
                ),
                0.015.sh.ph,
                const Text(
                  'اسماء موظفي القسم:',
                  style: TextStyle(overflow: TextOverflow.fade, fontSize: 20),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 0.34.sh,
                  child: ListView.builder(
                    itemCount: controller.departmentModel.depInfoUser!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.blackColor, width: 1))),
                        child: Text(
                        controller.departmentModel.depInfoUser![index].userName??'',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.blackColor,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget shimmerLoading() {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: AppColors.secondBlue,
        highlightColor: AppColors.greyColor.withOpacity(0.2),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 0.005.sh),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
                width: 0.95.sw,
                height: 0.1.sh,
              );
            }));
  }
}
