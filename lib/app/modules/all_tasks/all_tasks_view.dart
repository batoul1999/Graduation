import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_tasks_moel/get_all_tasks_model.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/all_tasks/all_tasks_controller.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:graduation/global/custom_widgets/custom_app_bar.dart';
import 'package:graduation/global/custom_widgets/custom_gradient_container.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';
import 'package:graduation/global/shared/app_colors.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class AllTasksView extends GetView<AllTasksController> {
  @override
  AllTasksController controller = Get.put(AllTasksController());

  AllTasksView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.loadTasks();
          },
          child: CustomGradientContainer(
            child: Column(
              children: [
                CustomAppBar(
                    text: 'جميع المهام',
                    onPressed: () async {
                      await controller.loadTasks();
                      await controller.loadDepartments();
                    },
                    isBool: controller.tasksList.isNotEmpty.obs),
                Obx(() => controller.isDepartmentsLoading
                    ? departmentShimmer()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.01.sw),
                        child: SizedBox(
                          width: 1.sw,
                          height: 0.07.sh,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.departmentsList.length + 1,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? InkWell(
                                        onTap: () {
                                          controller.isFiltered.value = false;
                                          controller.getAllTasks();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 0.008.sw,
                                              vertical: 0.01.sh),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.02.sw,
                                              vertical: 0.01.sh),
                                          decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  color: AppColors.mainBlue)),
                                          child: const CustomText(
                                              textType: TextStyleType.body,
                                              text: 'جميع الأقسام'),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          controller.isFiltered.value = true;

                                          controller.filterTasksByDepartment(
                                              department: controller
                                                  .departmentsList[index - 1]
                                                  .name!);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 0.008.sw,
                                              vertical: 0.01.sh),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.02.sw,
                                              vertical: 0.01.sh),
                                          decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  color: AppColors.mainBlue)),
                                          child: CustomText(
                                              textType: TextStyleType.body,
                                              text: controller
                                                  .departmentsList[index - 1]
                                                  .name!),
                                        ),
                                      );
                              }),
                        ),
                      )),
                Obx(() => controller.isTasksLoading
                    ? titleShimmer()
                    : Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0.03.sw, vertical: 0.01.sh),
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02.sw, vertical: 0.01.sh),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(
                                    color: AppColors.mainBlue, width: 2))),
                        width: 1.sw,
                        height: 0.05.sh,
                        child: Row(
                          children: [
                            0.12.sw.pw,
                            const CustomText(
                                textType: TextStyleType.bodyBig, text: 'الاسم'),
                            const Spacer(),
                            const CustomText(
                                textType: TextStyleType.bodyBig,
                                text: 'الحالة'),
                            0.03.sw.pw
                          ],
                        ),
                      )),
                Obx(() => controller.isTasksLoading
                    ? taskShimmer()
                    : SizedBox(
                        width: 1.sw,
                        height: 0.72.sh,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.isFiltered.value
                                ? controller.filteredTasksList.length
                                : controller.tasksList.length,
                            itemBuilder: (context, index) {
                              Tasks task = controller.isFiltered.value
                                  ? controller.filteredTasksList[index]
                                  : controller.tasksList[index];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.DOCUMENTSTATUS,
                                      arguments: {"task": task});
                                },
                                child: Container(
                                  width: 1.sw,
                                  height: 0.11.sh,
                                  decoration: BoxDecoration(
                                      color: AppColors.secondBlue),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 0.02.sw, vertical: 0.003.sh),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.05.sw, vertical: 0.01.sh),
                                  child: Row(
                                    children: [
                                      CustomText(
                                          textType: TextStyleType.body,
                                          textColor: AppColors.blackColor,
                                          text: task.name ?? 'لا يوجد اسم'),
                                      const Spacer(),
                                      CustomText(
                                          textType: TextStyleType.body,
                                          fontSize: 14.sp,
                                          textColor: task.status == 'مُنجز'
                                              ? AppColors.greenColor
                                              : task.status == "قيد الانتظار"
                                                  ? AppColors.mainBlue
                                                  : AppColors.redColor,
                                          text: task.status ?? 'لا يوجد حالة'),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget departmentShimmer() {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: AppColors.secondBlue,
        highlightColor: AppColors.whiteColor.withOpacity(0.2),
        child: SizedBox(
          height: 0.07.sh,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.01.sw),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                  ),
                  width: 0.35.sw,
                );
              }),
        ));
  }

  Widget taskShimmer() {
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
                height: 0.11.sh,
              );
            }));
  }

  Widget titleShimmer() {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: AppColors.secondBlue,
        highlightColor: AppColors.greyColor.withOpacity(0.2),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 0.2.sw,
                  height: 0.04.sh,
                ),
                0.5.sw.pw,
                SizedBox(
                  width: 0.2.sw,
                  height: 0.04.sh,
                ),
              ],
            ),
            0.005.sh.ph,
            SizedBox(
              width: 0.9.sw,
              height: 0.005.sh,
            ),
          ],
        ));
  }
}
