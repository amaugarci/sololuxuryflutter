import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/login/bindings/forgot_password_binding.dart';
import 'package:solo_luxury/app/screens/login/bindings/login_binding.dart';
import 'package:solo_luxury/app/screens/login/bindings/signup_bindings.dart';
import 'package:solo_luxury/app/screens/login/views/forgot_password.dart';
import 'package:solo_luxury/app/screens/login/views/login_screen.dart';
import 'package:solo_luxury/app/screens/login/views/signup_screen.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../app/screens/splash/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.signUpScreen,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: RoutesConstants.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}