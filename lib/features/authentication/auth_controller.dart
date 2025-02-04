import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<bool> password = true.obs;
  Rx<bool> confirmPassword = true.obs;

  seePassword() {
    password.value = !password.value;
  }

  seeConfirmPassword() {
    confirmPassword.value = !confirmPassword.value;
  }
}
