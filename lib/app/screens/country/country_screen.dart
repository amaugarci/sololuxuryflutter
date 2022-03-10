import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/app/screens/profile/profile_controller.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/country/store_views_model.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/country/store_websites_model.dart';

class CountryScreen extends GetView<CountryController> {
  CountryScreen({Key? key}) : super(key: key);

  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          backgroundColor: appColorAccent,
          body: SizedBox(
            width: Get.width,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.storeWebsitesList.value.length,
                        itemBuilder: (context, index) {
                          StoreWebSitesModel item =
                              StoreWebSitesModel.fromJson(controller.storeWebsitesList.value[index]);
                          return InkWell(
                              onTap: () async {
                                await controller.setLanguageAndCurrency(item, false);
                                Get.defaultDialog(
                                    title: "",
                                    middleText: "",
                                    backgroundColor: appColorAccent,
                                    titleStyle: TextStyle(color: Colors.white),
                                    middleTextStyle: TextStyle(color: Colors.white),
                                    onConfirm: () async {
                                      await controller.changeName(item.name);
                                      await controller.changeLanguage();
                                      await controller.changeCurrency();
                                      await controller.getCurrentLanguageCurrency();
                                      print("Length--> ${profileController.profileMenu.length}");
                                      profileController.profileMenu.value.removeLast();
                                      profileController.profileMenu.value.add(
                                          "${controller.localStoreModel!.name} (${controller.localStoreModel!.currentCurrency})");
                                      Get.back();
                                    },
                                    onCancel: () {
                                      // controller.setLanguageAndCurrency(item);
                                    },
                                    content: Column(
                                      children: [
                                        Obx(() {
                                          return Container(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: DropdownButton(
                                              focusColor: appColorButton,
                                              hint: CommonTextPoppins(''),
                                              onChanged: (language) {
                                                controller.setLanguageSelected(language.toString());
                                              },
                                              value: controller.langSelected.value,
                                              items: controller.rxLanguageList.map((languageSelect) {
                                                return DropdownMenuItem(
                                                  child: CommonTextPoppins(
                                                    languageSelect,
                                                    fontSize: 18.0,
                                                  ),
                                                  value: languageSelect,
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        }),
                                        Obx(() {
                                          return Container(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: DropdownButton(
                                              focusColor: appColorButton,
                                              hint: CommonTextPoppins(''),
                                              onChanged: (currency) {
                                                controller.setCurrencySelected(currency.toString());
                                              },
                                              value: controller.currencySelected.value,
                                              items: controller.rxCurrencyList.map((currencySelect) {
                                                return DropdownMenuItem(
                                                  child: CommonTextPoppins(
                                                    currencySelect,
                                                    fontSize: 18.0,
                                                  ),
                                                  value: currencySelect,
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        }),
                                      ],
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CommonTextPoppins(
                                  item.name ?? "",
                                  fontSize: 18.0,
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
