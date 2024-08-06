import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/global/shared/app_colors.dart';

import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.text, this.onPressed, required this.isBool});
  final String text;
  final VoidCallback? onPressed;
  final RxBool isBool;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.08.sh,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
      margin: EdgeInsets.symmetric(vertical: 0.01.sh, horizontal: 0.01.sw),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.secondDark),
      child: Center(
        child: Row(
          children: [
            CustomText(
                textType: TextStyleType.bodyBig,
                text: text,
                textColor: AppColors.whiteColor),
            const Spacer(),
            Obx(() => IconButton(
                onPressed: onPressed,
                icon: Icon(
                  isBool.value ? Icons.refresh : Icons.delete_forever,
                  color: AppColors.whiteColor,
                )))
          ],
        ),
      ),
    );
  }
}
