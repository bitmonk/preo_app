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

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
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
                            'Forgot password?',
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
                            'Don’t worry! It happens. Please enter the email associated with your account.',
                            style: TextStyle(color: AppColors.neutral700),
                          ),
                          SizedBox(height: Sizes.defaultSpace),
                          AppTextFormField(
                            labelText: 'Email Address',
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
                              btnText: 'Send Code',
                              onPressed: () {
                                Get.toNamed(Routes.emailVerify);
                              },
                            ),
                          ),
                          SizedBox(
                            height: Sizes.mdSpace,
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.titleColor),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Remember Password? ',
                                    ),
                                    TextSpan(
                                      text: 'Go back to SignIn',
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Sizes.spaceBtwItems),
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
