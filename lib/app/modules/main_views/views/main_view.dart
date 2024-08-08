import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/main_views/controllers/main_view_controller.dart';
import 'package:graduation/app/modules/main_views/views/arabic_editor_view.dart';
import 'package:graduation/app/modules/main_views/views/documents_view.dart';
import 'package:graduation/app/modules/main_views/views/home_view.dart';
import 'package:graduation/app/modules/main_views/views/notifications_view.dart';
import 'package:graduation/app/modules/main_views/views/profile_view.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class MainView extends GetView<MainViewController> {
  MainView({super.key});
  @override
  MainViewController controller = Get.put(MainViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        bottomNavigationBar: Container(
          margin: EdgeInsetsDirectional.only(
              start: 0.04.sw, end: 0.04.sw, bottom: 0.04.sw),
          height: 0.07.sh,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.25),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 1.sw * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.currentIndex.value = index;
                controller.pageController.jumpToPage(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      0.001.sh.ph,
                      Icon(
                        listOfIcons[index],
                        size: 1.sw * .076,
                        color: index == controller.currentIndex.value
                            ? AppColors.mainBlue
                            : AppColors.greyColor,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          bottom: index == controller.currentIndex.value
                              ? 0
                              : 1.sw * .029,
                          right: 1.sw * .0232,
                          left: 1.sw * .0232,
                        ),
                        width: 1.sw * .128,
                        height: index == controller.currentIndex.value
                            ? 1.sw * .014
                            : 0,
                        decoration: BoxDecoration(
                          color: AppColors.mainBlue,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.gradientBlue,
                  AppColors.gradientBlue.withOpacity(1),
                  AppColors.gradientBlue.withOpacity(0.7),
                  AppColors.whiteColor
                ]),
          ),
          child: PageView(
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DocumentsView(),
              ArabicEditorView(),
              HomeView(),
              NotificationsView(),
              ProfileView()
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.task,
    Icons.add_box,
    Icons.home,
    Icons.notifications_active,
    Icons.person_rounded,
  ];
}
