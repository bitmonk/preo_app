import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/features/Home/home.dart';
import 'package:preo/features/authentication/auth_controller.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/routes/routes.dart';

class ProfileOverview extends StatefulWidget {
  const ProfileOverview({super.key});

  @override
  State<ProfileOverview> createState() => ProfileOverviewState();
}

class ProfileOverviewState extends State<ProfileOverview> {
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
        title: AppStepper(index: 4),
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
                        'Nice!, how your profile is looking so far',
                        style: Get.theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Sizes.largeSpace),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            height: 128.h,
                            width: 128.w,
                            child: Obx(
                              () {
                                return authController.profileImage.value != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          child: Image.file(
                                            authController.profileImage.value!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Image.asset(
                                          Assets.images.png.defaultPicture.path,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Sizes.spaceBtwItems,
                          ),
                          Text(
                            'James Suparman',
                            style: Get.theme.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: Sizes.smallHeight,
                          ),
                          Text(
                            'Gold Coast, Australia',
                            style: TextStyle(
                              color: AppColors.neutral600,
                              fontSize: Sizes.text,
                            ),
                          ),
                          SizedBox(
                            height: Sizes.smallHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 46.h,
                                width: 35.w,
                                child: Image.asset(
                                    authController.selectedTeamLogo.value),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                authController.selectedTeamName.value,
                                style: TextStyle(
                                  fontSize: Sizes.subTitle,
                                  color: AppColors.neutral900,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Sizes.mdSpace,
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
                          Get.to(() => Home(),
                              transition: Transition.rightToLeftWithFade);
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
