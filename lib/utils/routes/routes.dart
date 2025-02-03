import 'package:get/get.dart';
import 'package:preo/features/authentication/login/email_verification.dart';
import 'package:preo/features/authentication/login/enter_new_pass.dart';
import 'package:preo/features/authentication/login/forgot_pass.dart';
import 'package:preo/features/authentication/login/login.dart';
import 'package:preo/features/authentication/login/pass_changed_nofify.dart';
import 'package:preo/features/authentication/signup/signup.dart';
import 'package:preo/features/onboarding/explainer/explainer.dart';
import 'package:preo/features/onboarding/splash/splash_screen.dart';

class Routes {
  static String splash = '/splash';
  static String explainer = '/explainer';
  static String signup = '/signup';
  static String login = '/login';
  static String forgotPass = '/forgotPass';
  static String emailVerify = '/emailVerify';
  static String enterNewPass = '/enterNewPass';
  static String passChangedNotify = '/passChangedNotify';
  static String getSplashRoute() => splash;
  static String getExplainerRoute() => explainer;
  static String getSignupRoute() => signup;
  static String getLoginRoute() => login;
  static String getForgotPassRoute() => forgotPass;
  static String getEmailVerifyRoute() => emailVerify;
  static String getEnterNewPassRoute() => enterNewPass;
  static String getPassChangedNotifyRoute() => passChangedNotify;
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: explainer,
      page: () => Explainer(),
    ),
    GetPage(
      name: signup,
      page: () => Signup(),
    ),
    GetPage(
      name: login,
      page: () => Login(),
    ),
    GetPage(
      name: forgotPass,
      page: () => ForgotPass(),
    ),
    GetPage(
      name: emailVerify,
      page: () => EmailVerification(),
    ),
    GetPage(
      name: enterNewPass,
      page: () => EnterNewPass(),
    ),
    GetPage(
      name: passChangedNotify,
      page: () => PassChangedNofify(),
    ),
  ];
}
