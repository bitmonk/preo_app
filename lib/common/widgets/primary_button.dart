import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size.fromHeight(56.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: Sizes.subTitle,
          color: AppColors.white,
          fontWeight: Sizes.font6,
        ),
      ),
    );
  }
}
