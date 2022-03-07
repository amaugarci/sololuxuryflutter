import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/Home/store_views_model.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Home/store_websites_model.dart';

class CountryScreen extends GetView<CountryController> {
  const CountryScreen({Key? key}) : super(key: key);

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
                              onTap: () {
                                controller.setLanguageAndCurrency(item);
                                print("controller.country.value-> ${controller.language.value}");
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CommonTextPoppins(
                                  item.name ?? "India",
                                  fontSize: 18.0,
                                ),
                              ));
                        },
                      ),
                    ),
                    Expanded(
                        child: Obx(() => Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CommonTextPoppins(
                                controller.language.value,
                                fontSize: 18.0,
                              ),
                            ))),
                    Expanded(
                        child: Obx(() => Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CommonTextPoppins(
                                controller.currency.value,
                                fontSize: 18.0,
                              ),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
