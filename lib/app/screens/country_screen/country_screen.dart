import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'country_screen_controller.dart';

class CountryPopUpScreen extends GetView<CountryPopUpScreenController> {
  const CountryPopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryPopUpScreenController());

    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text(
              "My Account",
              style: TextStyle(color: appColor),
            ),
            bottom: PreferredSize(
              child: Container(
                  height: 1.0, width: double.infinity, color: appColor),
              preferredSize: Size.fromHeight(1.0),
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.showCountry(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstant.myAccountText.tr.toUpperCase(),
                        style: TextStyle(),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstant.myOrdersText.tr.toUpperCase(),
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstant.myWidhListText.tr.toUpperCase(),
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstant.addressBookText.tr.toUpperCase(),
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstant.accountInfoText.tr.toUpperCase(),
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstant.storePaymentText.tr.toUpperCase(),
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstant.newsletterSubText.tr.toUpperCase(),
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ));
  }
}
