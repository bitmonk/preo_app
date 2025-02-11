import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Inter',
            primaryColor: AppColors.primary,
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                fontSize: Sizes.heading,
                fontWeight: Sizes.font6,
                color: AppColors.titleColor,
              ),
              headlineMedium: TextStyle(
                fontSize: Sizes.subHeading,
                fontWeight: Sizes.font6,
                color: AppColors.titleColor,
              ),
              headlineSmall: TextStyle(
                fontSize: Sizes.subTitle,
                fontWeight: Sizes.font5,
                color: AppColors.black.withAlpha(140),
              ),
              bodyMedium: TextStyle(
                fontSize: 16.sp,
                color: AppColors.neutral900,
              ),
              bodySmall: TextStyle(
                fontSize: 14.sp,
                color: AppColors.neutral900,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          defaultTransition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 100),
          initialRoute: Routes.getSignupRoute(),
          getPages: Routes.routes,
        );
      },
    );
  }
}
