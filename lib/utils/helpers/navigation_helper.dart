import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavigationHelper {
  static Future<void> navigateWithFadeTransition(
    BuildContext context,
    Widget destination,
  ) async {
    await pushWithNavBar(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
