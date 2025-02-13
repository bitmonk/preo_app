import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/app_spacing.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpacing(8.h),
              DashboardHeading(),
              VerticalSpacing(24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pending games'),
                        Text(
                          'You have 3 pending games',
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.neutral600),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardHeading extends StatelessWidget {
  const DashboardHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                Assets.images.png.profile.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          HorizontalSpacing(8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back 👋',
                style: Get.theme.textTheme.titleMedium,
              ),
              Text(
                'John Lee',
                style: Get.theme.textTheme.bodySmall,
              ),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.neutral400),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w, 6.h, 15.w, 6.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/preos.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  HorizontalSpacing(4.w),
                  Text(
                    '20.4 Preos',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
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
