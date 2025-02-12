import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/app_spacing.dart';
import 'package:preo/common/widgets/bottom_navbar.dart';
import 'package:preo/features/Home/home_controller.dart';
import 'package:preo/features/navs/home_nav.dart';
import 'package:preo/features/navs/profile_nav.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Obx(
        () => SafeArea(
          child: IndexedStack(
            index: HomeController.to.currentIndex.value,
            children: [
              HomeNav(),
              ProfileNav(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
