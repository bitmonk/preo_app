import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: PageView(
        children: [
          OnboardingPage(
            image: Images.explainer1,
            title: 'Welcome to \nPreo!',
            subtitle:
                'Get ready to experience the excitement of predictions with virtual Preo rewards.',
          ),
          OnboardingPage(
            image: Images.explainer2,
            title: 'asdf to \nPreo!',
            subtitle:
                'Get ready to experience the excitement of predictions with virtual Preo rewards.',
          ),
          OnboardingPage(
            image: Images.explainer3,
            title: 'Welcome to \nPreo!',
            subtitle:
                'Get ready to experience the excitement of predictions with virtual Preo rewards.',
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
                Transform.scale(
                  scale: 1.8,
                  child: Image(
                    height: HelperFunctions.screenHeight() * 1,
                    width: HelperFunctions.screenWidth() * 1,
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withAlpha(150), // Adjust opacity (0.0 - 1.0)
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
