import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';
import 'package:solo_luxury/app/screens/home/widget/header_widget.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_screen.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Image.asset(AppAsset.logo, width: 110),
            bottom: PreferredSize(
              preferredSize: Size(Get.width, 60),
              child: const HeaderWidget(),
            ),
          ),
          endDrawer: const Drawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(AppAsset.banner),
                ),
                detailsButton(LanguageConstant.aboutUsText.tr.toUpperCase(), 1),
                Visibility(
                  visible: controller.index.value == 1 ? true : false,
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
                        onPressed: () {
                          //        Get.to(const MyOrdersScreen());
                          Get.toNamed(RoutesConstants.myOrderScreen);
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
                detailsButton(LanguageConstant.contactText.tr.toUpperCase(), 2),
                detailsButton(LanguageConstant.socialText.tr.toUpperCase(), 3),
                detailsButton(LanguageConstant.companyText.tr.toUpperCase(), 4),
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
        if (controller.index.value == value) {
          controller.index.value = 0;
        } else {
          controller.index.value = value;
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
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Your E-Mail',
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
