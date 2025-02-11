import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preo/features/Home/dashboard.dart';
import 'package:preo/utils/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;

  Rx<bool> password = true.obs;
  Rx<bool> confirmPassword = true.obs;
  Rx<bool> acceptedTC = false.obs;
  Rx<File?> profileImage = Rx<File?>(null);
  var selectedTeamIndex = (-1).obs;
  var selectedTeamLogo = ''.obs;
  var selectedTeamName = ''.obs;

  // Validation state for password
  RxBool hasMinLength = false.obs;
  RxBool hasUpperCase = false.obs;
  RxBool hasLowerCase = false.obs;
  RxBool hasNumber = false.obs;
  RxBool hasSpecialCharacter = false.obs;
  RxBool isPasswordValid = false.obs;
  RxBool hasStartedTyping = false.obs;

  // Current Club Confirmation
  RxBool selectedValue = false.obs;

  seePassword() {
    password.value = !password.value;
  }

  seeConfirmPassword() {
    confirmPassword.value = !confirmPassword.value;
  }

  void checkPassword(String password) {
    hasStartedTyping.value = true;
    hasMinLength.value = password.length >= 8;
    hasUpperCase.value = password.contains(RegExp(r'[A-Z]'));
    hasLowerCase.value = password.contains(RegExp(r'[a-z]'));
    hasNumber.value = password.contains(RegExp(r'[0-9]'));
    hasSpecialCharacter.value =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    // Check if all password conditions are met
    isPasswordValid.value = hasMinLength.value &&
        hasUpperCase.value &&
        hasLowerCase.value &&
        hasNumber.value &&
        hasSpecialCharacter.value;
  }

  void loginApi() async {
    try {
      var response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': emailController.value.text,
        'password': passController.value.text,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'success');
        Get.off(Routes.getDashboard());
      } else {
        Get.snackbar('Error', data.toString());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Update this method to save the team logo and name along with the index
  void selectSingleTeam(int index, String logo, String name) {
    if (selectedTeamIndex.value == index) {
      selectedTeamIndex.value = -1;
      selectedTeamLogo.value = ''; // Reset logo
      selectedTeamName.value = ''; // Reset name
    } else {
      selectedTeamIndex.value = index;
      selectedTeamLogo.value = logo;
      selectedTeamName.value = name;
    }
  }

  void switchYesNoCheckbox(bool value) {
    selectedValue.value = value;
  }

  void selectTeam(int index) {
    selectedTeamIndex.value = index;
  }

  void toggleTC(bool value) {
    acceptedTC.value = !acceptedTC.value;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path);
    } else {
      profileImage.value = null;
    }
  }
}
