import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Explainer extends StatefulWidget {
  const Explainer({super.key});
  @override
  State<Explainer> createState() => _ExplainerState();
}

class _ExplainerState extends State<Explainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image(
                height: HelperFunctions.screenHeight() * 1,
                width: HelperFunctions.screenWidth() * 1,
                image: AssetImage(Images.explainer1),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
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
            // left: 32.w,
            child: Container(
              color: Colors.transparent,
              width: DeviceUtils.getScreenWidth(context) * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: DeviceUtils.getScreenHeight() * 0.8,
                    child: PageView(
                      children: [
                        OnboardingContent(
                          title: 'Welcome to Preo!',
                          subTitle:
                              'Get ready to experience the excitement of predictions with virtual Preo rewards.',
                        ),
                        OnboardingContent(
                          title: 'Predict with Preos',
                          subTitle:
                              'Use your knowledge and your skill, for free  and win Preos – the virtual currency',
                        ),
                        OnboardingContent(
                          title: 'Join the Competition',
                          subTitle:
                              'Join a group and challenge friends for the top spot.',
                        ),
                        OnboardingContent(
                          title: 'Ready to Play',
                          subTitle:
                              'You’re all set to start making predictions and climbing the leaderboard.',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.w),
                    child: SmoothPageIndicator(
                      controller: PageController(),
                      count: 4,
                    ),
                  ),
                  SizedBox(
                    height: 62.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      btnText: 'Get Started',
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

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          children: [
            Column(
              children: [
                Image(
                  height: HelperFunctions.screenHeight() * 1,
                  width: HelperFunctions.screenWidth() * 1,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ],
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withAlpha(150),
          ),
        ),
        Positioned(
          bottom: 70.h,
          left: 32.w,
          child: Container(
            color: Colors.transparent,
            height: 382.h,
            width: 366.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Sizes.explainerTitle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  width: 334.w,
                  child: Text(
                    'Get ready to experience the excitement of predictions with virtual Preo rewards.',
                    style: TextStyle(
                      fontSize: Sizes.miniSubHeading,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SmoothPageIndicator(
                  controller: PageController(),
                  count: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
