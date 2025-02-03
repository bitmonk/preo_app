import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/common/widgets/custom_form_field.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DeviceUtils.hideKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.bgColor,
          title: AppStepper(index: 0),
        ),
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
                            'Sign Up',
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
                              FormInputField(
                                labelText: 'Name',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              FormInputField(
                                labelText: 'Email Address',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              FormInputField(
                                labelText: 'Password',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              FormInputField(
                                labelText: 'Confirm Password',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            btnText: 'Continue',
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: Sizes.mdSpace,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.titleColor),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Do you have account? ',
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                        )
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
