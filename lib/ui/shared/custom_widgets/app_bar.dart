import 'package:flutter/material.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height,
    this.backgroundColor,
    this.leading,
    this.leadingWidth,
    required this.title,
    this.centerTitle = false,
    this.actions,
    this.titleWidget, // Optional custom title widget
  }) : assert(title != null || titleWidget != null);

  final double? height;
  final Color? backgroundColor;
  final Widget? leading;
  final double? leadingWidth;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? size.width / 3,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppColors.whiteColor,
      leading: leading,
      leadingWidth: leadingWidth ?? size.width / 10,
      title: Row(
        mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (leading != null) leading!,
          if (title != null) CustomText(text: title!, fontSize: 20),
          if (titleWidget != null) titleWidget!,
        ],
      ),
      titleSpacing: 0.0,
      centerTitle: centerTitle,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size(300, 70);
}
