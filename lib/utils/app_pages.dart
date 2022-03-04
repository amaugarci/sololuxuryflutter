import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/brand_list/brand_binding.dart';
import 'package:solo_luxury/app/screens/brand_list/brand_list_page.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_binding.dart';
import 'package:solo_luxury/app/screens/faq/faq_binding.dart';
import 'package:solo_luxury/app/screens/faq/faq_screen.dart';

import 'package:solo_luxury/app/screens/add_address/add_address.dart';
import 'package:solo_luxury/app/screens/add_address/add_address_binding.dart';
import 'package:solo_luxury/app/screens/filter/filter_binding.dart';
import 'package:solo_luxury/app/screens/filter/list_filter.dart';

import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_binding.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_screen.dart';
import 'package:solo_luxury/app/screens/login/bindings/forgot_password_binding.dart';
import 'package:solo_luxury/app/screens/login/bindings/login_binding.dart';
import 'package:solo_luxury/app/screens/login/bindings/signup_bindings.dart';
import 'package:solo_luxury/app/screens/login/views/forgot_password.dart';
import 'package:solo_luxury/app/screens/login/views/login_screen.dart';
import 'package:solo_luxury/app/screens/login/views/signup_screen.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_binding.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_screen.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../app/screens/my_account/my_account_binding.dart';
import '../app/screens/my_account/my_account_screen.dart';

import '../app/screens/product_listing/product_list_binding.dart';
import '../app/screens/product_listing/product_list_screen.dart';
import '../app/screens/search/search_screen.dart';
import '../app/screens/checkout_order/checkout_order_screen.dart';
import '../app/screens/splash/splash_screen.dart';
import '../app/screens/wishlist/wishlist_binding.dart';

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
      name: RoutesConstants.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => const SearchScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.wishlistScreen,
      page: () => MyWishListPage(),
      binding: WishlistBindings(),
    ),
    GetPage(
      name: RoutesConstants.checkoutOrderScreen,
      page: () => CheckoutOrderScreen(),
      binding: CheckoutOrderBindings(),
    ),
    GetPage(
      name: RoutesConstants.myOrderScreen,
      page: () => const MyOrdersScreen(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: RoutesConstants.faqScreen,
      page: () => const FaqScreen(),
      binding: FaqBindings(),
    ),
    GetPage(
      name: RoutesConstants.addAdressScreen,
      page: () => const AddAddressScreen(),
      binding: AddAddressBindings(),
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
    GetPage(
      name: RoutesConstants.orderConfirmScreen,
      page: () => OrderConfirmationPage(),
      binding: OrderConfirmationBinding(),
  ),
  GetPage(
      name: RoutesConstants.filterScreen,
      page: () => ListFilterPage(),
      binding: FilterBinding(),
  ),
  GetPage(
      name: RoutesConstants.brandScreen,
      page: () => const BrandListPage(),
      binding: BrandBinding(),
    ),
  GetPage(
      name: RoutesConstants.myAccountScreen,
      page: () => const MyAccountPage(),
      binding: MyAccountBinding(),
    ),
  ];
}
