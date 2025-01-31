import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/routes/routes.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find<OnboardingController>();

  late final PageController pageController;
  Rx<int> currentPageIndex = 0.obs;

  final List<String> backgroundImages = [
    Images.explainer1,
    Images.explainer2,
    Images.explainer3,
    Images.explainer4,
  ];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  // Update the page indicator when the page changes
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  // Navigate to the next page
  void nextPage() {
    if (pageController != null &&
        currentPageIndex.value < backgroundImages.length - 1) {
      pageController.animateToPage(
        currentPageIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(Routes.getSignupRoute());
    }
  }

  // Dispose of the PageController when the controller is closed
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
