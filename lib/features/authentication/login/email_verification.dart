import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:preo/common/widgets/custom_form_field.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preo/utils/routes/routes.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      SizedBox(
                        width: double.infinity,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      DeviceUtils.getScreenWidth(context) * 0.7,
                                  child: Text(
                                    'Please check your email',
                                    style: TextStyle(
                                      fontSize: Sizes.heading,
                                      fontWeight: Sizes.font6,
                                      color: AppColors.titleColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Sizes.largeSpace,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.titleColor),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'We’ve sent a code to ',
                                      ),
                                      TextSpan(
                                        text: 'helloworld@gmail.com',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Sizes.defaultSpace),
                                CustomVerificationInput(),
                                SizedBox(height: Sizes.spaceBtwItems),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            btnText: 'Verify',
                            onPressed: () =>
                                Get.toNamed(Routes.getEnterNewPassRoute()),
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
                                    text: 'Send code again ',
                                  ),
                                  TextSpan(
                                    text: ' 00:30',
                                    style:
                                        TextStyle(color: AppColors.neutral700),
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

class CustomVerificationInput extends StatelessWidget {
  CustomVerificationInput({
    super.key,
  });

  final defaultPinTheme = PinTheme(
      width: 68,
      height: 68,
      textStyle: TextStyle(
          fontSize: Sizes.heading,
          color: AppColors.neutral800,
          fontWeight: Sizes.font6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral600),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8));
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
    );
  }
}
