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

class ChooseTeam extends StatefulWidget {
  const ChooseTeam({super.key});

  @override
  State<ChooseTeam> createState() => _ChooseTeamState();
}

class _ChooseTeamState extends State<ChooseTeam> {
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

    return GestureDetector(
      onTap: () {
        DeviceUtils.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          surfaceTintColor: AppColors.bgColor,
          title: AppStepper(index: 1),
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
                          style: TextStyle(
                            fontSize: Sizes.heading,
                            fontWeight: Sizes.font6,
                            color: AppColors.titleColor,
                          ),
                        ),
                        SizedBox(height: Sizes.defaultSpace),
                        Text(
                          'Choose your favourite team to personalize your experience!',
                          style: TextStyle(
                            fontSize: Sizes.subHeading,
                            fontWeight: Sizes.font6,
                            color: AppColors.titleColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Sizes.spaceBtwItems),
                        Column(
                          children: teams.map((team) {
                            int index = teams.indexOf(team);
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: Sizes.spaceBtwItems),
                              child: Obx(
                                () => TeamSelectionList(
                                  authController: authController,
                                  title: team['title']!,
                                  logoImage: team['logoImage']!,
                                  subtitle: team['subtitle']!,
                                  isSelected:
                                      authController.selectedTeamIndex.value ==
                                          index,
                                  onTap: () =>
                                      authController.selectSingleTeam(index),
                                ),
                              ),
                            );
                          }).toList(),
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
                          Get.toNamed(Routes.getCurrentClub());
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
      ),
    );
  }
}

class TeamSelectionList extends StatelessWidget {
  const TeamSelectionList({
    super.key,
    required this.authController,
    required this.title,
    required this.logoImage,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final AuthController authController;
  final String title;
  final String logoImage;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: ListTile(
          leading: Image.asset(logoImage),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primary : Colors.transparent,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
