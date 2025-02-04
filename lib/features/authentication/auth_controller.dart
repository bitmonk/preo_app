import 'package:get/get.dart';

class AuthController extends GetxController {
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

  seePassword() {
    password.value = !password.value;
  }

  seeConfirmPassword() {
    confirmPassword.value = !confirmPassword.value;
  }

  void checkPassword(String password) {
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
}
