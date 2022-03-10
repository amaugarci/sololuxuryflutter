import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_order_screen.dart';
import 'package:solo_luxury/app/screens/dashboard/dashboard_controller.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/profile/profile_screen.dart';
import 'package:solo_luxury/app/screens/search/search_screen.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../country/country_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            TabBarView(
                controller: controller.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //TODO: PAGES
                  const HomeScreen(),
                  const SearchScreen(),
                  CheckoutOrderScreen(),
                  MyWishListPage(),
                  const ProfileScreen(),
                ]),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 57.0,
          child: Material(
            elevation: 0.0,
            shadowColor: appSubscribeButtonColor,
            child: BottomAppBar(
              // notchMargin: 8,
              elevation: 0.0,
              notchMargin: 0.8,
              color: appColorPrimary,
              shape: const CircularNotchedRectangle(),
              child: TabBar(
                onTap: (int index) async {
                  print("index: $index");
                },
                tabs: [
                  Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Image.asset(
                      AppAsset.home,
                      height: 18.0,
                      width: 18.0,
                      color: appSubscribeButtonColor,
                    ),
                    // text: isHome ? '${S.of(context).homeText.toUpperCase()}' : '${S.of(context).homeText}',
                    child: CommonTextOpenSans(
                      "Home",
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                      color: appSubscribeButtonColor,
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Image.asset(
                      AppAsset.search1,
                      height: 18.0,
                      width: 18.0,
                      color: appSubscribeButtonColor,
                    ),
                    // text: isHome ? '${S.of(context).homeText.toUpperCase()}' : '${S.of(context).homeText}',
                    child: CommonTextOpenSans(
                      "Search",
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                      color: appSubscribeButtonColor,
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Image.asset(
                      AppAsset.tag,
                      height: 18.0,
                      width: 18.0,
                      color: appSubscribeButtonColor,
                    ),
                    // text: isHome ? '${S.of(context).homeText.toUpperCase()}' : '${S.of(context).homeText}',
                    child: CommonTextOpenSans(
                      "Designers",
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                      color: appSubscribeButtonColor,
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Image.asset(
                      AppAsset.heart1,
                      height: 20.0,
                      width: 20.0,
                      color: appSubscribeButtonColor,
                    ),
                    child: CommonTextOpenSans(
                      "WishList",
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                      color: appSubscribeButtonColor,
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Image.asset(
                      AppAsset.userProfile,
                      height: 18.0,
                      width: 18.0,
                      color: appSubscribeButtonColor,
                    ),
                    child: CommonTextOpenSans(
                      "Login",
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                      color: appSubscribeButtonColor,
                    ),
                  ),
                ],
                labelStyle: const TextStyle(
                  fontSize: 10,
                ),
                physics: const ClampingScrollPhysics(),
                labelColor: appSubscribeButtonColor,
                unselectedLabelColor: appSubscribeButtonColor,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(0.0),
                labelPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                controller: controller.tabController,
              ),
            ),
          ),
        ));
  }
}
