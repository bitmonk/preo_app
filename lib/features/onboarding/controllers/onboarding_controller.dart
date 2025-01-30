import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preo/utils/constants/images.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final List<String> backgroundImages = [
    Images.explainer1,
    Images.explainer2,
    Images.explainer3,
    Images.explainer4
  ];
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
