import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_screen.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../app/screens/product_listing/product_list_binding.dart';
import '../app/screens/product_listing/product_list_screen.dart';
import '../app/screens/search/search_screen.dart';
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
  ];
}