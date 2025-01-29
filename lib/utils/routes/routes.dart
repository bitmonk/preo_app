import 'package:get/get.dart';
import 'package:preo/features/onboarding/explainer/explainer.dart';
import 'package:preo/features/onboarding/splash/splash_screen.dart';

class Routes {
  static String splash = '/splash';
  static String explainer = '/explainer';
  static String getSplashRoute() => splash;
  static String getExplainerRoute() => explainer;
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: explainer,
      page: () => Explainer(),
    )
  ];
}
