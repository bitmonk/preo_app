import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preo/features/Home/dashboard/dashboard.dart';
import 'package:preo/features/Home/dashboard/lineup.dart';
import 'package:preo/utils/constants/nav_ids.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/details') {
          return GetPageRoute(
            settings: settings,
            page: () => const LineupScreen(),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => const DashboardScreen(),
          );
        }
      },
      // return null;
    );
  }
}
