import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:preo/features/Home/home_controller.dart';
import 'package:preo/features/Home/screens/dashboard/dashboard.dart';
import 'package:preo/features/Home/screens/games/games_overview.dart';
import 'package:preo/features/Home/screens/groups/group_screen.dart';
import 'package:preo/features/Home/screens/notifications/notification_screen.dart';
import 'package:preo/features/Home/screens/profile/profile.dart';
import 'package:preo/features/authentication/auth_controller.dart';
import 'package:preo/gen/assets.gen.dart';
import 'package:preo/utils/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthController controller = Get.put(AuthController());
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Obx(
        () => PersistentTabView(
          controller: homeController.persistentTabController,
          backgroundColor: controller.selectedColor.value,
          navBarHeight: 68,
          screenTransitionAnimation: ScreenTransitionAnimation(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
          ),
          onTabChanged: (index) {
            homeController.updateCurrentNavIndex(index);
          },
          tabs: [
            PersistentTabConfig(
              screen: DashboardScreen(),
              item: ItemConfig(
                icon: Obx(() => SvgPicture.asset(
                      homeController.selectedIndex.value == 0
                          ? Assets.icons.selectedHome
                          : Assets.icons.homeIcon,
                      width: 24,
                      height: 24,
                    )),
                inactiveIcon: SvgPicture.asset(
                  Assets.icons.homeIcon,
                  width: 24,
                  height: 24,
                ),
                title: homeController.selectedIndex.value == 0 ? "Home" : "",
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                activeForegroundColor: AppColors.primary,
              ),
              // activeForegroundColor: AppColors.primary,

              // inactiveForegroundColor: AppColors.white,
            ),
            PersistentTabConfig(
              screen: GroupScreen(),
              item: ItemConfig(
                icon: Obx(() => SvgPicture.asset(
                      homeController.selectedIndex.value == 1
                          ? Assets.icons.selectedGroup
                          : Assets.icons.people,
                      width: 24,
                      height: 24,
                    )),
                inactiveIcon: SvgPicture.asset(
                  Assets.icons.people,
                  width: 24,
                  height: 24,
                ),
                title: homeController.selectedIndex.value == 1 ? "Groups" : "",
                activeForegroundColor: AppColors.primary,
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PersistentTabConfig(
              screen: const GamesOverviewScreen(),
              item: ItemConfig(
                activeForegroundColor: AppColors.white,
                inactiveForegroundColor: AppColors.primary,
                icon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(110),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Obx(
                    () => SvgPicture.asset(
                      homeController.selectedIndex.value == 2
                          ? Assets.icons.selectedGame
                          : Assets.icons.gameIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            PersistentTabConfig(
              screen: NotificationScreen(),
              item: ItemConfig(
                icon: Obx(() => SvgPicture.asset(
                      homeController.selectedIndex.value == 3
                          ? Assets.icons.selectedNotification
                          : Assets.icons.notification,
                      width: 24,
                      height: 24,
                    )),
                inactiveIcon: SvgPicture.asset(
                  Assets.icons.notification,
                  width: 24,
                  height: 24,
                ),
                title: homeController.selectedIndex.value == 3
                    ? "Notifications"
                    : "",
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                activeForegroundColor: AppColors.primary,
              ),
            ),
            PersistentTabConfig(
              screen: ProfileScreen(),
              item: ItemConfig(
                icon: Obx(() => SvgPicture.asset(
                      homeController.selectedIndex.value == 4
                          ? Assets.icons.selectedProfile
                          : Assets.icons.profile,
                      width: 24,
                      height: 24,
                    )),
                inactiveIcon: SvgPicture.asset(
                  Assets.icons.profile,
                  width: 24,
                  height: 24,
                ),
                activeForegroundColor: AppColors.primary,
                title: homeController.selectedIndex.value == 4 ? "Profile" : "",
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style13BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}
