import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';
import 'package:solo_luxury/app/screens/home/widget/header_widget.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/app_routes.dart';
import '../product_detail/product_detail_screen.dart';
import '../search/search_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                controller.scaffoldKey.value.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(ImageConstant.menuIcon),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.searchIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.heartIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                      color: Colors.black),
                ),
              ),
            ],
            title: Image.asset(AppAsset.logo, width: 110),
            /*bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),*/
          ),
          drawer: const Drawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(AppAsset.banner, fit: BoxFit.fitHeight),
                ),

                ExpandableNotifier(
                    child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme:  ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                          expandIcon: Container(),
                          collapseIcon: Container(),
                          iconPadding: const EdgeInsets.all(0.0)
                        ),
                        header: detailsButton(
                            LanguageConstant.aboutUsText.tr.toUpperCase(),
                            1),
                        controller:
                            controller.aboutUsExpandableController.value,
                        collapsed: Container(),
                        expanded: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const AboutUsScreen());
                                },
                                child: Text(
                                  LanguageConstant.aboutUsText.tr,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const ReferFriendScreen());
                                },
                                child: Text(
                                  LanguageConstant.referFriendText.tr,
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              TextButton(
                                onPressed: () async{
                                  await Future.delayed(const Duration(seconds: 2), () async  {
                                    Get.toNamed(RoutesConstants.productsScreen);
                                  });
                                },
                                child: Text(
                                  LanguageConstant.returnsRefundsText.tr,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  LanguageConstant.faqText.tr,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        builder: (_, collapsed, expanded) {
                          return Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          );
                        },
                      ),
                    ),
                  ],
                )),
                ExpandableNotifier(
                    child: Column(
                      children: <Widget>[
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme:  ExpandableThemeData(
                                headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                expandIcon: Container(),
                                collapseIcon: Container(),
                                iconPadding: const EdgeInsets.all(0.0)
                            ),
                            header: detailsButton(LanguageConstant.contactText.tr.toUpperCase(),
                                2),
                            collapsed: Container(),
                            expanded: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const AboutUsScreen());
                                    },
                                    child: Text(
                                      LanguageConstant.aboutUsText.tr,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const ReferFriendScreen());
                                    },
                                    child: Text(
                                      LanguageConstant.referFriendText.tr,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      LanguageConstant.returnsRefundsText.tr,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      LanguageConstant.faqText.tr,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (_, collapsed, expanded) {
                              return Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(crossFadePoint: 0),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
                ExpandableNotifier(child: Column(
                      children: <Widget>[
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme:  ExpandableThemeData(
                                headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                expandIcon: Container(),
                                collapseIcon: Container(),
                                iconPadding: const EdgeInsets.all(0.0)
                            ),
                            header: detailsButton(LanguageConstant.socialText.tr.toUpperCase(),
                                3),
                            collapsed: Container(),
                            expanded: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const AboutUsScreen());
                                    },
                                    child: Text(
                                      LanguageConstant.aboutUsText.tr,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const ReferFriendScreen());
                                    },
                                    child: Text(
                                      LanguageConstant.referFriendText.tr,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      LanguageConstant.returnsRefundsText.tr,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      LanguageConstant.faqText.tr,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (_, collapsed, expanded) {
                              return Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(crossFadePoint: 0),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
                ExpandableNotifier(child: Column(
                      children: <Widget>[
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme:  ExpandableThemeData(
                                headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                expandIcon: Container(),
                                collapseIcon: Container(),
                                iconPadding: const EdgeInsets.all(0.0)
                            ),
                            header: detailsButton(LanguageConstant.companyText.tr.toUpperCase(),
                                4),
                            collapsed: Container(),
                            expanded: Container(),
                            builder: (_, collapsed, expanded) {
                              return Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(crossFadePoint: 0),
                              );
                            },
                          ),
                        ),
                      ],
                    )),


                const SizedBox(height: 20),
                emailSubscribe(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if(value == 1) {
         controller.aboutUsExpandableController.value.toggle();
        }
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: appColor,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget emailSubscribe() {
    return Container(
      height: 47,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: appColor, width: 1.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: LanguageConstant.yourEmailText.tr,
                hintStyle: TextStyle(color: Colors.black54, fontSize: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 47,
            width: 120,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: appColor, width: 1.5),
            ),
            alignment: Alignment.center,
            child: const Text(
              'SUBSCRIBE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
