import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/app_text_formfield.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterNewPass extends StatefulWidget {
  const EnterNewPass({super.key});

  @override
  State<EnterNewPass> createState() => _EnterNewPassState();
}

class _EnterNewPassState extends State<EnterNewPass> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 42.h, // Set height here
                    width: 42.w, // Set width here
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.neutral500,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Handle back action
                        Get.back();
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/back_arrow.svg',
                        height: 24.h, // Set size of the icon
                        width: 24.w, // Set size of the icon
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.largeSpace,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reset Password ',
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
                            'Please type something you’ll remember',
                            style: TextStyle(color: AppColors.neutral700),
                          ),
                          SizedBox(height: Sizes.defaultSpace),
                          AppTextFormField(
                            labelText: 'Password must be 8 characters',
                          ),
                          SizedBox(height: Sizes.spaceBtwItems),
                          AppTextFormField(
                            labelText: 'Confirm New Password',
                          ),
                          SizedBox(height: Sizes.spaceBtwItems),
                        ],
                      ),
                    ),
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
                              btnText: 'Change Password',
                              onPressed: () {
                                Get.toNamed(Routes.passChangedNotify);
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
