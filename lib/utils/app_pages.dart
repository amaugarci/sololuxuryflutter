import 'package:get/get.dart';

import 'package:solo_luxury/app/screens/affiliate_program/affiliate_program_bindings.dart';
import 'package:solo_luxury/app/screens/affiliate_program/affiliate_program_screen.dart';
import 'package:solo_luxury/app/screens/brand_list/brand_binding.dart';
import 'package:solo_luxury/app/screens/brand_list/brand_list_page.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_binding.dart';
import 'package:solo_luxury/app/screens/contact_us/contact_us_binding.dart';
import 'package:solo_luxury/app/screens/contact_us/contact_us_screen.dart';
import 'package:solo_luxury/app/screens/faq/faq_binding.dart';
import 'package:solo_luxury/app/screens/faq/faq_screen.dart';

import 'package:solo_luxury/app/screens/Guest_Returns/guest_returns_binding.dart';
import 'package:solo_luxury/app/screens/Guest_Returns/guest_returns_screen.dart';
import 'package:solo_luxury/app/screens/add_address/add_address.dart';
import 'package:solo_luxury/app/screens/add_address/add_address_binding.dart';

import 'package:solo_luxury/app/screens/filter/filter_binding.dart';
import 'package:solo_luxury/app/screens/filter/list_filter.dart';

import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_menu_screen.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_binding.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_screen.dart';
import 'package:solo_luxury/app/screens/login/bindings/forgot_password_binding.dart';
import 'package:solo_luxury/app/screens/login/bindings/login_binding.dart';
import 'package:solo_luxury/app/screens/login/bindings/signup_bindings.dart';
import 'package:solo_luxury/app/screens/login/views/forgot_password.dart';
import 'package:solo_luxury/app/screens/login/views/login_screen.dart';
import 'package:solo_luxury/app/screens/login/views/signup_screen.dart';
import 'package:solo_luxury/app/screens/my_tickets/my_tickets_binding.dart';
import 'package:solo_luxury/app/screens/my_tickets/my_tickets_screen.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_binding.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_binding.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_screen.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_binding.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_screen.dart';
import 'package:solo_luxury/app/screens/search/search_binding.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/app/screens/tickets/my_tickets_screen.dart';
import 'package:solo_luxury/app/screens/address_book/address_book.dart';
import 'package:solo_luxury/app/screens/address_book/address_book_binding.dart';
import 'package:solo_luxury/app/screens/country_screen/country_screen.dart'
    as country;
import 'package:solo_luxury/app/screens/country_screen/country_screen_binding.dart';
import 'package:solo_luxury/app/screens/selecet_country/select_country.dart';
import 'package:solo_luxury/app/screens/selecet_country/select_country_binding.dart';
import 'package:solo_luxury/app/screens/store_credit/store_credit.dart';
import 'package:solo_luxury/app/screens/store_credit/store_credit_binding.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_screen.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../app/screens/contact_us/contact_us_screen.dart';
import '../app/screens/dashboard/dashboard_binding.dart';
import '../app/screens/dashboard/dashboard_screen.dart';
import '../app/screens/my_account/my_account_binding.dart';
import '../app/screens/my_account/my_account_screen.dart';
import '../app/screens/influencer_registraction/influencer_binding.dart';
import '../app/screens/influencer_registraction/influencer_registration_screen.dart';
import '../app/screens/country/country_binding.dart';
import '../app/screens/country/country_screen.dart';
import '../app/screens/dashboard/dashboard_binding.dart';
import '../app/screens/dashboard/dashboard_screen.dart';
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
      name: RoutesConstants.countryScreen,
      page: () => CountryScreen(),
      binding: CountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => const ProductListScreen(),
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
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => const InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.affiliateProgramScreen,
      page: () => const AffiliateProgramScreen(),
      binding: AffiliateProgramBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountMenuScreen,
      page: () => MyAccountMenuPage(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.myTicketsScreen,
      page: () => MyTicketScreen(),
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
      page: () => const MyAccountScreen(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.returnsAndRefundsScreen,
      page: () => const ReturnsAndRefundsScreen(),
      binding: ReturnsAndRefundsBinding(),
    ),
    GetPage(
      name: RoutesConstants.addressBookScreen,
      page: () => const AddressBookScreen(),
      binding: AddressBookBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryScreen,
      page: () => CountryScreen(),
      binding: CountryScreenBindings(),
    ),
    GetPage(
      name: RoutesConstants.guestReturnsScreen,
      page: () => const GuestReturns(),
      binding: GuestReturnsBindings(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.searchScreen,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RoutesConstants.contactUsScreen,
      page: () => ContactUsScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: RoutesConstants.myTickets,
      page: () => const MyTicketsScreen(),
      binding: MyTicketsBindings(),
    ),
  ];
}
