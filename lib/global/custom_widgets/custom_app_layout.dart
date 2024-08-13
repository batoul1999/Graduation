import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/global/shared/app_colors.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CustomAppLayout extends StatelessWidget {
  Widget? backWardWidget;
  Widget? forWardWidget;
  Widget? mainIcon;
  double? height;
  Color? color;
  CustomAppLayout(
      {super.key,
      this.backWardWidget,
      this.forWardWidget,
      this.height,
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
              color: color ?? AppColors.secondDark.withOpacity(0.8)),
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 0.6.sh, top: 0.1.sh),
            child: SizedBox(
                width: 0.02.sw,
                height: 0.005.sh,
                child: mainIcon?? Lottie.asset('assets/lottie/logo1.json')),
          ),
        ),
        backWardWidget ?? const SizedBox.shrink(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: Get.width,
            height: height ?? 400.h,
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
