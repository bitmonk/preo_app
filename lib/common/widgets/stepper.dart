import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/utils/constants/colors.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: index == i ? AppColors.primary400 : AppColors.primary100,
            borderRadius: BorderRadius.circular(51.r),
          ),
          height: 5.h,
          width: 42.w,
        ),
      ),
    );
  }
}
