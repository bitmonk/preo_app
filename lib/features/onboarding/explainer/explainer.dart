import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/features/onboarding/controllers/onboarding_controller.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Explainer extends StatelessWidget {
  const Explainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Obx(
                () => Image(
                  height: HelperFunctions.screenHeight(),
                  width: HelperFunctions.screenWidth(),
                  image: AssetImage(controller
                      .backgroundImages[controller.currentPageIndex.value]),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(130),
            ),
          ),
          Positioned(
            bottom: 48.h,
            child: SizedBox(
              width: DeviceUtils.getScreenWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: DeviceUtils.getScreenHeight() * 0.8,
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: controller.updatePageIndicator,
                      children: const [
                        OnboardingContent(
                          title: 'Welcome to Preo!',
                          subTitle:
                              'Get ready to experience the excitement of predictions with virtual Preo rewards.',
                        ),
                        OnboardingContent(
                          title: 'Predict with Preos',
                          subTitle:
                              'Use your knowledge and your skill, for free and win Preos – the virtual currency',
                        ),
                        OnboardingContent(
                          title: 'Join the Competition',
                          subTitle:
                              'Join a group and challenge friends for the top spot.',
                        ),
                        OnboardingContent(
                          title: 'Ready to Play',
                          subTitle:
                              "You're all set to start making predictions and climbing the leaderboard.",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.w),
                    child: Obx(
                      () => AnimatedSmoothIndicator(
                        activeIndex: controller.currentPageIndex.value,
                        count: 4,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: AppColors.splashDot,
                          dotHeight: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 62.h),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 366.w,
                      child: Obx(
                        () {
                          String getButtonText(int index) {
                            if (index == 0) return 'Get Started';
                            if (index == 3) return 'Let\'s Go!';
                            return 'Next';
                          }

                          return PrimaryButton(
                            btnText: getButtonText(
                                controller.currentPageIndex.value),
                            onPressed: controller.nextPage,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 250.w,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: Sizes.explainerTitle,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
            width: 334.w,
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: Sizes.miniSubHeading,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }
}
