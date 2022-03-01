import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_binding.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/login/login_screen.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import '../app/screens/checkout_order/checkout_order_screen.dart';
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
      name: RoutesConstants.checkoutOrderScreen,
      page: () =>  CheckoutOrderScreen(),
      binding: CheckoutOrderBindings(),
    ),
  ];
}