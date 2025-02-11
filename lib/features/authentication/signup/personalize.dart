import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/features/authentication/auth_controller.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/routes/routes.dart';

class PersonalizePage extends StatefulWidget {
  const PersonalizePage({super.key});

  @override
  State<PersonalizePage> createState() => _PersonalizePageState();
}

class _PersonalizePageState extends State<PersonalizePage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    final List<Color> colors = [
      AppColors.primary,
      AppColors.neutral800,
      AppColors.secondary500,
      AppColors.black,
      AppColors.primary200,
      AppColors.secondary100,
      AppColors.black,
    ];
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: AppColors.bgColor,
        title: AppStepper(index: 3),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Sizes.mdSpace),
                      Text(
                        'Sign Up',
                        style: Get.theme.textTheme.headlineLarge,
                      ),
                      SizedBox(height: Sizes.defaultSpace),
                      Text(
                        'Adding photo to make your profile stuning',
                        style: Get.theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Sizes.spaceBtwItems),
                      InkWell(
                        onTap: () {
                          authController.pickImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          height: 98.h,
                          width: 98.h,
                          child: Obx(() {
                            return authController.profileImage.value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.file(
                                      authController.profileImage.value!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Center(
                                    child: Image.asset(
                                      Assets.images.png.defaultPicture.path,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
                      ),
                      Divider(
                        indent: 2,
                        endIndent: 5,
                        color: AppColors.neutral200,
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Choose color to personalize brand',
                          style: Get.theme.textTheme.bodyLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
                      ),
                      SizedBox(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: colors.map((color) {
                              return GestureDetector(
                                onTap: () {
                                  print('Selected color: $color');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 12.w),
                                  width: 42.0,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
                      ),
                      Divider(
                        indent: 2,
                        endIndent: 5,
                        color: AppColors.neutral200,
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 316.w,
                                child: Text(
                                  'I accept the Terms and I have read the Privacy Policy & cookies',
                                  style: Get.theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                          Transform.scale(
                            scale:
                                1, // Adjust this value to increase or decrease the size
                            child: Switch(
                              activeTrackColor: AppColors.primary,
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        btnText: 'Continue',
                        onPressed: () {
                          Get.toNamed(Routes.getOverview());
                        },
                      ),
                    ),
                    SizedBox(height: Sizes.mdSpace),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.getLoginRoute()),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.titleColor,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: 'Do you have an account? '),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
