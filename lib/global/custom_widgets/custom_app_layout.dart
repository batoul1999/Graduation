import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class CustomAppLayout extends StatelessWidget {
  Widget? backWardWidget;
  Widget? forWardWidget;
  Widget? mainIcon;
  Color? color;
  CustomAppLayout(
      {super.key,
      this.backWardWidget,
      this.forWardWidget,
      this.mainIcon,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              color: color ?? AppColors.secondDark.withOpacity(0.9)),
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 0.6.sh, top: 0.1.sh),
            child: SizedBox(
                width: 0.02.sw,
                height: 0.005.sh,
                child: mainIcon ??
                    Icon(
                      Icons.edit_document,
                      color: AppColors.whiteColor,
                      size: 0.3.sw,
                    )),
          ),
        ),
        backWardWidget ?? const SizedBox.shrink(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: Get.width,
            height: 400.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradientBlue,
                    AppColors.gradientBlue.withOpacity(1),
                    AppColors.whiteColor
                  ]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: forWardWidget ?? const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
