import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/Guest_Returns/guest_returns_binding.dart';
import 'package:solo_luxury/app/screens/Guest_Returns/guest_returns_screen.dart';
import 'package:solo_luxury/app/screens/add_address/add_address.dart';
import 'package:solo_luxury/app/screens/add_address/add_address_binding.dart';
import 'package:solo_luxury/app/screens/address_book/address_book.dart';
import 'package:solo_luxury/app/screens/address_book/address_book_binding.dart';
import 'package:solo_luxury/app/screens/country_screen/country_screen.dart';
import 'package:solo_luxury/app/screens/country_screen/country_screen_binding.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_binding.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_screen.dart';
import 'package:solo_luxury/app/screens/selecet_country/select_country.dart';
import 'package:solo_luxury/app/screens/selecet_country/select_country_binding.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/app/screens/store_credit/store_credit.dart';
import 'package:solo_luxury/app/screens/store_credit/store_credit_binding.dart';
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
    GetPage(
      name: RoutesConstants.addAdressScreen,
      page: () => const AddAddressScreen(),
      binding: AddAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.selectCountryScreen,
      page: () => const SelectCountryScreen(),
      binding: SelectCountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.storeCreditScreen,
      page: () => const StoreCreditScreen(),
      binding: StoreCreditBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreen,
      page: () => const MyAccountPage(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.addressBookScreen,
      page: () => const AddressBookScreen(),
      binding: AddressBookBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryScreen,
      page: () => const CountryScreen(),
      binding: CountryScreenBindings(),
    ),
    GetPage(
      name: RoutesConstants.guestReturnsScreen,
      page: () => const GuestReturns(),
      binding: GuestReturnsBindings(),
    ),
  ];
}
