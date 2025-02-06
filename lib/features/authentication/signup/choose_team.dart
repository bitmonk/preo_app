import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/app_text_formfield.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/features/authentication/auth_controller.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/routes/routes.dart';

class ChooseTeam extends StatefulWidget {
  const ChooseTeam({super.key});

  @override
  State<ChooseTeam> createState() => _ChooseTeamState();
}

class _ChooseTeamState extends State<ChooseTeam> {
  @override
  Widget build(BuildContext context) {
    List teamList = [
      ['Vikings Rugby', true],
      ['Western Rugby', false],
      ['Melbourne', false],
    ];
    AuthController authController = Get.put(AuthController());
    // final bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    bool isChecked = false;

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
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 34.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                          children: [
                            TeamSelectionList(authController: authController),
                            SizedBox(height: Sizes.spaceBtwItems),
                            TeamSelectionList(authController: authController),
                            SizedBox(height: Sizes.spaceBtwItems),
                            TeamSelectionList(authController: authController),
                            SizedBox(height: Sizes.spaceBtwItems),
                          ],
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
                              btnText: 'Continue',
                              onPressed: () {
                                // Get.toNamed(Routes.getLoginRoute());
                              },
                            ),
                          ),
                          SizedBox(height: Sizes.mdSpace),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.getLoginRoute()),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.titleColor,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Do you have account? ',
                                    ),
                                    TextSpan(
                                      text: 'Sign In',
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => authController.selectTeam(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/images/teams/vikings.png',
          ),
          title: Text(
            'Vikings Rugby',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text('Cheer for the Vikings and ...'),
          trailing: Obx(
            () => Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: authController.teamSelected.value
                    ? AppColors.primary
                    : Colors.transparent,
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: authController.teamSelected.value
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
