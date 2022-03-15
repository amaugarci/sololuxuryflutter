import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/common_widget/custom_expansion_tile.dart' as custom;
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/app_routes.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: appColorAccent,
          appBar: AppBar(
            leading: const Icon(
              Icons.close,
              size: 24.0,
            ),
            elevation: 0,
            backgroundColor: backGroundColor,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Image.asset(
                    AppAsset.banner,
                    height: 500.0,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              child: CommonTextOpenSans(
                                LanguageConstant.aboutUsText.tr,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const ReferFriendScreen());
                              },
                              child: CommonTextOpenSans(
                                LanguageConstant.referFriendText.tr,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: CommonTextOpenSans(
                                LanguageConstant.returnsRefundsText.tr,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: CommonTextOpenSans(
                                LanguageConstant.faqText.tr,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
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
                ],
              ),
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
        decoration: const BoxDecoration(
          color: appColor,
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
      height: 35.0,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: CommonTextField(
              hintText: LanguageConstant.yourEmail1Text.tr,
              controller: TextEditingController(),
              textFieldBorder: Border.all(color: Colors.transparent),
              textColor: appTextFieldHintColor,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RoutesConstants.checkoutOrderScreen);
            },
            child: Container(
              height: 35,
              width: 120,
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: appColor, width: 1.5),
              ),
              alignment: Alignment.center,
              child: CommonTextOpenSans(
                LanguageConstant.subscribeText.tr,
                color: appSubscribeButtonColor,
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}