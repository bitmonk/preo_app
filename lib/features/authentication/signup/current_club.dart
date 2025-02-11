import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/data/team_data.dart';
import 'package:preo/features/authentication/auth_controller.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/routes/routes.dart';

class CurrentClub extends StatefulWidget {
  const CurrentClub({super.key});

  @override
  State<CurrentClub> createState() => _CurrentClubState();
}

class _CurrentClubState extends State<CurrentClub> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    final teamData = TeamData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: AppColors.bgColor,
        title: AppStepper(index: 2),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
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
                        'Are you a current club member?',
                        style: Get.theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Sizes.spaceBtwItems),
                      Obx(
                        () => Column(
                          children: [
                            YesNoCheckbox(
                              title: 'Yes',
                              value: authController.selectedValue.value,
                              onChanged: (value) {
                                authController.switchYesNoCheckbox(true);
                              },
                            ),
                            SizedBox(height: 8.h),

                            // Show teams dropdown only when "Yes" is selected
                            if (authController.selectedValue.value)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  children: teamData.teams
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    int index = entry.key;
                                    Map<String, String> team = entry.value;

                                    return GestureDetector(
                                      onTap: () {
                                        authController.selectTeam(index);
                                      },
                                      child: Obx(
                                        () => Container(
                                          // margin:
                                          // EdgeInsets.symmetric(vertical: 6.h),
                                          decoration: BoxDecoration(
                                            color: authController
                                                        .selectedTeamIndex
                                                        .value ==
                                                    index
                                                ? AppColors.selectedBg
                                                : Colors.white,
                                            // borderRadius:
                                            //     BorderRadius.circular(8.r),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w, vertical: 12.h),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.w),
                                                child: Image(
                                                  image: AssetImage(
                                                      team['logoImage']!),
                                                  height: 30.h,
                                                  width: 30.w,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    team['title']!,
                                                    style: Get.theme.textTheme
                                                        .headlineSmall,
                                                  ),
                                                  SizedBox(height: 4.h),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                            SizedBox(height: Sizes.spaceBtwItems),
                            YesNoCheckbox(
                              title: 'No',
                              value: !authController.selectedValue.value,
                              onChanged: (value) {
                                authController.switchYesNoCheckbox(false);
                              },
                            ),
                          ],
                        ),
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
                          Get.toNamed(Routes.getPersonalise());
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

class YesNoCheckbox extends StatelessWidget {
  const YesNoCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });
  final String title;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 54.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            width: 1,
            color: AppColors.neutral50,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Get.theme.textTheme.bodySmall,
            ),
            Transform.scale(
              scale: 1.1,
              child: Checkbox(
                activeColor: Get.theme.primaryColor,
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
