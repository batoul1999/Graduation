import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/ui/shared/colors.dart';

class InputField extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onsaved;
  final void Function()? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final String? text;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? label;
  final Widget? icon;
  final int? maxLength;
  final Color? color;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool? alignLabelWithHint;
  final int? maxLines;
  final int? minLines;
  final int? fontSize;
  final double? borderRadius;
  final TextEditingController? controller;
  final double? fieldWidth;
  final String? hint;
  final bool enabled;
  final void Function(String?)? onChanged;
  final EdgeInsets? contentPadding;
  final InputDecoration? decoration;
  final TextDirection? textDirection;
  final TextStyle? style;
  final bool? obscureText;
  final bool? autofocus;
  final Widget? childWidget;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  const InputField({
    super.key,
    this.validator,
    this.onsaved,
    this.keyboardType,
    this.label,
    this.maxLength,
    this.icon,
    this.focusNode,
    this.color,
    this.textColor,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.text,
    this.alignLabelWithHint,
    this.maxLines,
    this.minLines,
    this.controller,
    this.fontSize,
    this.borderRadius,
    this.fieldWidth,
    this.hint,
    this.enabled = true,
    this.onChanged,
    this.onTap,
    this.contentPadding,
    this.decoration,
    this.textDirection,
    this.style,
    this.obscureText,
    this.autofocus,
    this.childWidget,
    this.hintStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth ?? 1.sw,
      child: textField(),
    );
  }

  Widget textField() {
    return Focus(
      skipTraversal: true,
      onFocusChange: (value) {
        value
            ? controller?.selection = TextSelection.fromPosition(
                TextPosition(offset: controller?.text.length ?? 0))
            : null;
      },
      child: TextFormField(
        textDirection: textDirection,
        textCapitalization: TextCapitalization.sentences,
        autofocus: autofocus ?? false,
        initialValue: text,
        enabled: enabled,
        minLines: maxLines ?? 1,
        obscureText: obscureText ?? false,
        style: style,
        keyboardType: keyboardType,
        maxLength: maxLength,
        cursorColor: AppColors.mainColor1,
        validator: validator,
        onSaved: onsaved,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        focusNode: focusNode,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        maxLines: maxLines ?? 1,
        controller: controller,
        decoration: decoration ??
            InputDecoration(
              hintText: hint,
              hintStyle: hintStyle ?? TextStyle(fontSize: 20.sp),
              suffixIcon: childWidget,
              isDense: true,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.h),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor1),
                  borderRadius: BorderRadius.circular(borderRadius ?? 35.r)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.w, color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 35.r)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.w, color: AppColors.mainColor1),
                borderRadius: BorderRadius.circular(borderRadius ?? 35.r),
              ),
              fillColor: color ?? AppColors.whiteColor,
              errorStyle: TextStyle(color: AppColors.redColor, fontSize: 15.sp),
              filled: true,
              labelText: label,
              labelStyle: labelStyle ??
                  TextStyle(fontSize: 20.sp, color: AppColors.mainColor1),
              prefixIcon: icon,
              alignLabelWithHint: alignLabelWithHint,
            ),
      ),
    );
  }
}
