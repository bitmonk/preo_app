import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:preo/features/games/home.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;

  Rx<bool> password = true.obs;
  Rx<bool> confirmPassword = true.obs;

  // Validation state for password
  RxBool hasMinLength = false.obs;
  RxBool hasUpperCase = false.obs;
  RxBool hasLowerCase = false.obs;
  RxBool hasNumber = false.obs;
  RxBool hasSpecialCharacter = false.obs;
  RxBool isPasswordValid = false.obs;
  RxBool hasStartedTyping = false.obs;
  RxBool teamSelected = false.obs;

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

  void selectTeam() {
    teamSelected.value = !teamSelected.value;
  }

  void loginApi() async {
    try {
      var response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': emailController.value.text,
        'password': passController.value.text,
      });
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'success');
        Get.off(() => HomePage());
      } else {
        Get.snackbar('Error', data.toString());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
