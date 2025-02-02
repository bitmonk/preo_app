import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        body: SafeArea(
          child: Container(
            color: AppColors.bgColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: PageController(),
                        count: 5,
                        axisDirection: Axis.horizontal,
                        effect: SlideEffect(
                            spacing: 12.w,
                            radius: 51.r,
                            dotWidth: 42.w,
                            dotHeight: 5.h,
                            paintStyle: PaintingStyle.fill,
                            strokeWidth: 1.5,
                            dotColor: AppColors.primary100,
                            activeDotColor: AppColors.primary400),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 48.h),
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
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    fontSize: Sizes.subTitle,
                                    color: AppColors.formTextColor),
                                filled: true,
                                fillColor: AppColors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.inputBorder),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 18.h,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
