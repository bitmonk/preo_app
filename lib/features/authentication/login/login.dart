import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/app_text_formfield.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/routes/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false; // Checkbox state

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
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 32.h),
                            child: Image(
                              image: AssetImage(Images.logoBlack),
                              height: 112.h,
                              width: 103.w,
                            ),
                          ),
                          SizedBox(
                            height: Sizes.spaceBtwSections,
                          ),
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: Sizes.heading,
                              fontWeight: Sizes.font6,
                              color: AppColors.titleColor,
                            ),
                          ),
                          SizedBox(
                            height: Sizes.defaultSpace,
                          ),
                          Column(
                            children: [
                              AppTextFormField(
                                labelText: 'Email Address',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              AppTextFormField(
                                labelText: 'Password',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isChecked
                                                ? AppColors.primary
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: Colors.red, width: 2),
                                          ),
                                          child: isChecked
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 14,
                                                )
                                              : null,
                                        ),
                                        SizedBox(
                                          width: Sizes.spaceBtwItemsRowItems,
                                        ),
                                        Text('Remember Me'),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.toNamed(Routes.forgotPass),
                                    child: Text(
                                      'Forgot Password?',
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
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
                              btnText: 'Login',
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: Sizes.mdSpace,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.getSignupRoute()),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.titleColor),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Don\'t have account? ',
                                    ),
                                    TextSpan(
                                      text: 'Sign Up',
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
