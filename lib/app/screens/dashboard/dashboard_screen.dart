import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/common_widget/custom_expansion_tile.dart'
    as custom;
import 'package:solo_luxury/app/screens/checkout_order/checkout_order_screen.dart';
import 'package:solo_luxury/app/screens/dashboard/dashboard_controller.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_menu_screen.dart';
import 'package:solo_luxury/app/screens/search/search_screen.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../../main.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldkey,
        backgroundColor: appColorAccent,
        drawer: getDrawer(),
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
                  //ProfileScreen(),
                  MyAccountMenuPage(),
                ]),
            appBarWidget(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 57.0,
          child: Material(
            elevation: 0.0,
            shadowColor: appSubscribeButtonColor,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: BottomAppBar(
                // notchMargin: 8,
                elevation: 0.0,
                notchMargin: 0.8,
                color: appColorPrimary,
                shape: const CircularNotchedRectangle(),
                child: TabBar(
                  onTap: (int index) async {
                    print("index: $index");
                    switch (index) {
                      case 0:
                        controller.appbarTitle.value = "";
                        break;
                      case 1:
                        controller.appbarTitle.value =
                            LanguageConstant.search1Text.tr;
                        break;
                      case 2:
                        await localStore.getToken();
                        controller.appbarTitle.value =
                            LanguageConstant.designersText.tr;
                        break;
                      case 3:
                        controller.appbarTitle.value =
                            LanguageConstant.wishListText.tr;
                        break;
                      case 4:
                        controller.appbarTitle.value =
                            LanguageConstant.loginText.tr;
                        break;
                    }
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
                        LanguageConstant.homeText.tr,
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
                        LanguageConstant.search1Text.tr,
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
                        LanguageConstant.designersText.tr,
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
                        LanguageConstant.wishListText.tr,
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
                        LanguageConstant.loginText.tr,
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
          ),
        )));
  }

  appBarWidget() {
    return Container(
      width: Get.width,
      color: appColorAccent,
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(Get.context!).viewPadding.top + 10.0,
            left: 10.0,
            right: 15.0,
            bottom: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40.0,
              width: Get.width * 0.35,
              child: controller.appbarTitle.value.isEmpty
                  ? Image.asset(
                      AppAsset.logo,
                    )
                  : Center(
                      child: CommonTextOpenSans(
                        controller.appbarTitle.value,
                        fontSize: 16.0,
                        color: appColorPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print("onTap ->");

                    if (!controller.scaffoldkey.currentState!.isDrawerOpen) {
                      controller.scaffoldkey.currentState!.openDrawer();
                    }
                  },
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Center(
                      child: Image.asset(
                        AppAsset.menu,
                        height: 20.0,
                        width: 20.0,
                        color: appColorPrimary,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesConstants.cartScreen);
                      },
                      child: SvgPicture.asset(
                        AppAsset.cart,
                        height: 20.0,
                        width: 20.0,
                        color: brown833404,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getDrawer() {
    return SizedBox(
      child: Drawer(
        child: SizedBox(
          width: Get.width - 40.0,
          child: getDrawerView(),
        ),
      ),
    );
  }

  Widget getDrawerView() {
    if (controller.menuModel?.value.childrenData == null) {
      return Container();
    }
    return Container(
      height: Get.height,
      width: Get.width,
      color: appColorAccent,
      child: Stack(
        children: [
          Container(
            height: 40.0,
            margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: Get.height,
                    color: appColorPrimary,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppAsset.menu,
                                color: appColorAccent,
                                height: 18.0,
                                width: 18.0)),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              LanguageConstant.menuText.tr,
                              style: TextStyle(
                                  color: appColorAccent, fontSize: 16.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.height,
                    color: appColorPrimaryGrey,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      LanguageConstant.accountText.tr,
                      style: const TextStyle(
                          color: appColorDarkGrey, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 65),
            child: Stack(
              children: [
                ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.builder(
                            // Important: Remove any padding from the ListView.
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller
                                .menuModel?.value.childrenData!.length,
                            itemBuilder: (context, index) {
                              ChildrenData? itemLevel1 = controller
                                  .menuModel?.value.childrenData![index];
                              return itemLevel1!.isActive!
                                  ? Column(
                                      children: [
                                        custom.ExpansionTile(
                                          tileHeight: 40,
                                          verticalVisualDensity: -1,
                                          contentPadding: const EdgeInsets.only(
                                              left: 10, right: 20),
                                          title: Text(itemLevel1.name!,
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: appColorDarkGrey)),
                                          isIcon:
                                              itemLevel1.childrenData!.isEmpty
                                                  ? true
                                                  : false,
                                          children: [
                                            ListView.builder(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 10),
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: itemLevel1
                                                  .childrenData!.length,
                                              itemBuilder: (context, index1) {
                                                ChildrenData itemLevel2 =
                                                    itemLevel1
                                                        .childrenData![index1];
                                                return custom.ExpansionTile(
                                                  title: Text(itemLevel2.name!,
                                                      style: const TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: appColorDarkGrey,
                                                      )),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 25, right: 20),
                                                  tileHeight: 35,
                                                  verticalVisualDensity: -1,

                                                  isIcon: itemLevel2.childrenData!.isEmpty ? true : false,
                                                  onExpansionChanged: (a){
                                                    if(itemLevel2.childrenData!.isEmpty){
                                                      Get.toNamed(RoutesConstants.productListScreen,
                                                          arguments: [itemLevel2.id,itemLevel1.name]);

                                                    }
                                                  },
                                                  children: [
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount: itemLevel2
                                                            .childrenData!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index2) {
                                                          ChildrenData
                                                              itemLevel3 =
                                                              itemLevel2
                                                                      .childrenData![
                                                                  index2];
                                                          return GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  RoutesConstants
                                                                      .productListScreen,
                                                                  arguments: [
                                                                    itemLevel3
                                                                        .id,itemLevel1.name
                                                                  ]);
                                                            },
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          40.0,
                                                                      top: 3.0,
                                                                      bottom:
                                                                          3.0),
                                                              child: Text(
                                                                itemLevel3
                                                                    .name!,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        appColorDarkGrey),
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                  ],
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          height: 2.0,
                                          color: appColorDarkGrey,
                                        )
                                      ],
                                    )
                                  : Container();
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
