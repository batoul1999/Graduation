import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class CustomDatePicker extends StatelessWidget {
  CustomDatePicker(
      {super.key,
      required this.controller,
      required this.hintText,
      this.width,
      this.fillColor,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.height,
      this.contentPadding,
      required this.pickFirst,
      this.onChanged});
  late RxString controller;
  final String hintText;
  final double? width;
  final double? height;
  final Color? fillColor;
  final DateTime? initialDate;
  final EdgeInsetsDirectional? contentPadding;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool pickFirst;
  final VoidCallback? onChanged;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: pickFirst
            ? () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate ?? DateTime.now(),
                  firstDate: firstDate ?? DateTime(1960),
                  lastDate: lastDate ?? DateTime(2028),
                );
                if (selectedDate != null) {
                  controller.value = selectedDate.toString();
                }
                if (onChanged != null) onChanged!();
              }
            : () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.greyColor.withOpacity(0.3),
                  offset: const Offset(1, 2),
                  blurRadius: 0.8),
              BoxShadow(
                  color: AppColors.greyColor.withOpacity(0.3),
                  offset: const Offset(-2, -1),
                  blurRadius: 0.8)
            ],
            color: fillColor ?? AppColors.whiteColor,
          ),
          height: height ?? 0.06.sh,
          width: width ?? 0.2.sw,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: 0.012.sh, horizontal: 0.03.sw),
            child: Row(
              children: [
                Text(
                  controller.value == ''
                      ? hintText
                      : controller.value.substring(0, 10),
                  style: TextStyle(
                      color: controller.value == ''
                          ? AppColors.greyColor
                          : AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      controller.value = '';
                    },
                    child: Tooltip(
                      message: 'clear date'.tr,
                      child: Icon(
                        Icons.cancel,
                        color: AppColors.redColor,
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
