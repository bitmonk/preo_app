import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<int> selectedIndex = 0.obs;

  var currentIndex = 0.obs;
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);
  void changeIndex(int newIndex) {
    if (currentIndex.value != newIndex) {
      Get.nestedKey(currentIndex.value)?.currentState?.popUntil(
            (route) => route.isFirst,
          );
      currentIndex.value = newIndex;
    }
  }

  updateCurrentNavIndex(int index) {
    selectedIndex.value = index;
  }
}
