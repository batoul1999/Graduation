import 'package:flutter/material.dart';
import 'package:graduation/global/shared/app_colors.dart';

class CustomGradientContainer extends StatelessWidget {
  const CustomGradientContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientBlue.withOpacity(0.5),
              AppColors.gradientBlue.withOpacity(1),
              AppColors.whiteColor
            ]),
      ),
      child: child,
    );
  }
}
