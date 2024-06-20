import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/ui/shared/colors.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight});
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? AppColors.mainColor1,
          fontSize: fontSize ?? 20.sp,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
