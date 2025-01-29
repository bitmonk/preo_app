import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Get.toNamed(Routes.getExplainerRoute());
    });

    Widget logo = Image.asset(
      'assets/logos/logoWhite.png',
      height: 166.h,
      width: 144.w,
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.splashBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: logo
                .animate()
                .fadeIn(duration: 700.ms, delay: 500.ms, curve: Curves.easeIn)
                .slide(
                  begin: const Offset(0, 3),
                  end: Offset.zero,
                  duration: 900.ms,
                  curve: Curves.easeIn,
                ),
          ),
        ],
      ),
    );
  }
}
