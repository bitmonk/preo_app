import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preo/features/Home/profile/profile.dart';
import 'package:preo/utils/constants/nav_ids.dart';

class ProfileNav extends StatelessWidget {
  const ProfileNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profile),
      onGenerateRoute: (settings) {
        if (settings.name != '/profile') {
          return GetPageRoute(
            settings: settings,
            page: () => const ProfileScreen(),
          );
        }
        return null;
      },
    );
  }
}
