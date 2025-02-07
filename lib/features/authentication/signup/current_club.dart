import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/features/authentication/auth_controller.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:get/get.dart';
import 'package:preo/utils/routes/routes.dart';

class CurrentClub extends StatefulWidget {
  const CurrentClub({super.key});

  @override
  State<CurrentClub> createState() => _CurrentClubState();
}

class _CurrentClubState extends State<CurrentClub> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teams = [
      {
        'title': 'Vikings Rugby',
        'logoImage': Assets.images.teams.vikings.path,
        'subtitle': 'Cheer for the Vikings and conquer the field!',
      },
      {
        'title': 'Western Rugby',
        'logoImage': Assets.images.teams.western.path,
        'subtitle': 'Join Western Rugby for an unforgettable season!',
      },
      {
        'title': 'Melbourne',
        'logoImage': Assets.images.teams.melbourne.path,
        'subtitle': 'Support Melbourne and witness greatness!',
      },
      {
        'title': 'Vikings Rugby',
        'logoImage': Assets.images.teams.vikings.path,
        'subtitle': 'Cheer for the Vikings and conquer the field!',
      },
      {
        'title': 'Western Rugby',
        'logoImage': Assets.images.teams.western.path,
        'subtitle': 'Join Western Rugby for an unforgettable season!',
      },
      {
        'title': 'Melbourne',
        'logoImage': Assets.images.teams.melbourne.path,
        'subtitle': 'Support Melbourne and witness greatness!',
      },
    ];

    AuthController authController = Get.put(AuthController());

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
                                authController.switchYesNoCheckbox(
                                    true); // Set to true for Yes
                              },
                            ),
                            SizedBox(
                              height: Sizes.spaceBtwItems,
                            ),
                            YesNoCheckbox(
                              title: 'No',
                              value: !authController.selectedValue.value,
                              onChanged: (value) {
                                authController.switchYesNoCheckbox(
                                    false); // Set to false for No
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      btnText: 'Continue',
                      onPressed: () {
                        // Get.toNamed(Routes.getLoginRoute());
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
              SizedBox(height: 20.h), // Adds space at the bottom
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
        // Trigger the onChanged callback when the row is tapped
        onChanged(!value); // Toggle the value when tapped
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
              scale:
                  1.1, // Adjust the scale factor as needed (e.g., 1.5 for 50% larger)
              child: Checkbox(
                activeColor: Get.theme.primaryColor,
                value: value,
                onChanged:
                    onChanged, // Disable the checkbox's onChanged since it's handled by the row tap
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
