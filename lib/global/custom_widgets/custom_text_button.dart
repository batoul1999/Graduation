import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  TextDecoration? decoration;
   CustomTextButton(
      {super.key,
      required this.text,
      this.textColor,
      this.textSize,
      this.textWeight,
      this.decoration,
      required this.onPressed,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(foregroundColor: AppColors.secondDark),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? AppColors.secondDark,
              fontSize: textSize ?? 15.sp,
              fontWeight: textWeight ?? FontWeight.w500,
              decoration:decoration?? TextDecoration.underline,
              decorationColor: AppColors.secondDark,
              decorationThickness: 2),
        ));
  }
}
