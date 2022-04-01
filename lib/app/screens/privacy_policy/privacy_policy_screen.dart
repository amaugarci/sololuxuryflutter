import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/privacy_policy/privacy_policy_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';

import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class PrivacyPolicyScreen extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(title: LanguageConstant.privacyPolicyText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            Text(
              'PRIVACY POLICY',
              style: TextStyle(
                color: appColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),

            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.searchIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.heartIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      LanguageConstant.policyHeadingText.tr,
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        color: appColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount:
                            controller.getprivacyPolicy[0].cmsText!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final getList =
                              controller.getprivacyPolicy[0].cmsText![index];
                          return expandDetailWidget(
                              getList.title!, getList.description!, index + 1);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget expandDetailWidget(String text, String subText, int value) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (controller.index.value == value) {
            controller.index.value = 0;
          } else {
            controller.index.value = value;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: appColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: controller.index.value != value
                      ? Border.all(color: Colors.transparent)
                      : const Border(
                          bottom: BorderSide(width: 1.0, color: appColor),
                        ),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    controller.index.value == value
                        ? const Icon(
                            Icons.remove,
                            color: appColor,
                          )
                        : const Icon(
                            Icons.add,
                            color: appColor,
                          ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.index.value == value ? true : false,
                child: Html(
                  data: subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
