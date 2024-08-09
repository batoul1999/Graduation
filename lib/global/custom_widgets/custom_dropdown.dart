import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/global/shared/app_colors.dart';

class StaticCustomDrop extends StatelessWidget {
  final RxString textName;
  final RxInt selectedValue;
  final RxList<String> itemList;
  final RxList<String>? copyList;
  final bool? removeFromList;
  final double? width;
  final double? textSize;
  final double? height;
  const StaticCustomDrop(
      {super.key,
      required this.textName,
      required this.selectedValue,
      required this.itemList,
      this.width,
      this.height,
      this.textSize,
      this.copyList,
      this.removeFromList});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        onMenuStateChange: (_) {},
        buttonStyleData: ButtonStyleData(
          height: height ?? 0.06.sh,
          width: width ?? 0.25.sw,
          padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColors.whiteColor,
            ),
            color: AppColors.whiteColor,
          ),
          elevation: 2,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        hint: Text(
          textName.value,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: textSize ?? 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        items: itemList.map<DropdownMenuItem<String>>((element) {
          return DropdownMenuItem<String>(
            value: element,
            child: Text(
              element.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          );
        }).toList(),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.blackColor,
            size: 0.04.sw,
          ),
          iconSize: 50.r,
        ),
        isExpanded: true,
        onChanged: (String? y) {
          textName.value = y!;

          for (var element in itemList) {
            if (element == y) {
              selectedValue.value = itemList.indexOf(element);

              if (removeFromList == false) {
                // If removeFromList is false, return an empty string
              } else {
                // Perform operations only if copyList and itemList are not null
                if (copyList != null) {
                  copyList!.add(element);
                  itemList.remove(element);
                }
              }
            }
          }
        },
      ));
    });
  }
}
