// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_divider.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/screens/profile/profile_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/app_routes.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSubscribeButtonColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            appBarWidget(),
            Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top + 90.0, left: 30.0, right: 25.0),
                child: Obx(() => Column(
                      children: [
                        titleWithArrow("MY ACCOUNT"),
                        titleWithArrow("MY ORDERS"),
                        titleWithArrow("MY WISH LIST"),
                        titleWithArrow("ADDRESS BOOK"),
                        titleWithArrow("ACCOUNT INFORMATION"),
                        titleWithArrow("STORED PAYMENT METHODS"),
                        titleWithArrow("NEWSLETTER SUBSCRIPTIONS"),
                        titleWithArrow("${controller.countryCurrency.value}", onTap: () {
                          Get.toNamed(RoutesConstants.countryScreen);
                        }),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  appBarWidget() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top + 15.0),
      child: Column(
        children: [
          CommonTextOpenSans(
            LanguageConstant.myAccountText.tr,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: appColorPrimary,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15.0,
          ),
          CommonDivider(
            color: appColorPrimary,
          ),
        ],
      ),
    );
  }

  Widget titleWithArrow(title, {onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextOpenSans(
              title ?? "",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
            SizedBox(
              height: 18.0,
              width: 18.0,
              child: Center(
                child: SvgPicture.asset(
                  AppAsset.rightIcon,
                  height: 10.0,
                  width: 10.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
