import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      this.buttonText,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.textColor,
      this.shape,
      this.fontSize,
      this.child});
  final void Function() onPressed;
  final String? buttonText;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? fontSize;
  final OutlinedBorder? shape;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: child ??
            CustomText(
              text: buttonText ?? '',
              textColor: textColor ?? AppColors.whiteColor,
              fontSize: fontSize ?? 35.sp,
            ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width ?? 1.sw, height ?? 0.15.sw),
            backgroundColor: backgroundColor ?? AppColors.mainColor1,
            shadowColor: AppColors.blueColor,
            side: BorderSide(
                color: borderColor ?? AppColors.blackColor,
                width: borderWidth ?? 1),
            shape: shape ??
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        borderRadius ?? screenWidth(10)))));
  }
}
