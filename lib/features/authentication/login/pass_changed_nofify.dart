import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/custom_form_field.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PassChangedNofify extends StatefulWidget {
  const PassChangedNofify({super.key});

  @override
  State<PassChangedNofify> createState() => _PassChangedNofifyState();
}

class _PassChangedNofifyState extends State<PassChangedNofify> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return GestureDetector(
      onTap: () => DeviceUtils.hideKeyboard(context),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: AppColors.bgColor,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 34.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),
                      Image.asset(
                        'assets/icons/confetti.png',
                        height: 300.h,
                        width: 300.w,
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
                      ),
                      Text(
                        'Password Changed',
                        style: TextStyle(
                          fontSize: Sizes.heading,
                          fontWeight: Sizes.font6,
                          color: AppColors.titleColor,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.largeSpace,
                      ),
                      Text(
                        'Your password has been successfully changed, now you can go back to Login and try again with new password.',
                        style: TextStyle(
                          color: AppColors.neutral700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Sizes.spaceBtwItems),
                    ],
                  ),
                  if (!keyboardVisible)
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              btnText: 'Back to Login',
                              onPressed: () {
                                Get.toNamed(Routes.getLoginRoute());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
