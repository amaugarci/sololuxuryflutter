import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/app_constants.dart';

class MyAccountScreen extends GetView<MyAccountController> {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: appColorAccent,
        appBar: commonAppbar(title: LanguageConstant.accountInformationText.tr),
        body: controller.isLoading.value != true
            ? const Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: appColorFDF3F1,
                          icon: const Icon(Icons.expand_more_outlined,
                              color: appColor),
                          value: controller.chosenValue.value,
                          elevation: 2,
                          style: commonTextStyle(),
                          items: controller.data
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            LanguageConstant.myAccountText.tr,
                            style: commonTextStyle(),
                          ),
                          onChanged: (String? value) {
                            controller.chosenValue.value = value!;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    newsLettersDesign(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageConstant.addressBookText.tr,
                            style: commonTextStyle600(fontSize: 20.0),
                          ),
                          Text(
                            LanguageConstant.manageAddresses.tr,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: blackColor,
                              decorationThickness: 1.5,
                              fontSize: 14,
                              color: blackColor,
                              fontFamily: AppConstants.fontOpenSans,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultBillingDesign(),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultShippingDesign(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  commonTextStyle() {
    return TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: appColorButton,
    );
  }

  commonTextStyleNormal() {
    return TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16,
      color: appColorButton,
    );
  }

  commonTextStyle300() {
    return TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: appColorButton,
    );
  }

  commonTextStyle600({var fontSize}) {
    return TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: appColorButton,
    );
  }

  newsLettersDesign() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              LanguageConstant.newsLetters.tr,
              style: commonTextStyle600(fontSize: 18.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
            child: Divider(
              height: 1,
              thickness: 1,
              color: appColorDullPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Text(
              LanguageConstant.newsLettersContain.tr,
              style: commonTextStyle300(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InkWell(
              onTap: (){
                Get.toNamed(RoutesConstants.newsLetterScreen);
              },
              child: Container(
                height: 52,
                width: Get.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  LanguageConstant.edit.tr,
                  style: commonTextStyle300(),
                ),
                decoration: const BoxDecoration(
                  color: appColorAccent,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: appColorFDF3F1,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 8,
          )
        ],
      ),
      padding: const EdgeInsets.only(
        top: 21,
        bottom: 10,
      ),
      alignment: Alignment.centerLeft,
    );
  }

  defaultBillingDesign() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              LanguageConstant.defaultBillingAddress.tr,
              style: commonTextStyle600(fontSize: 18.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
            child: Divider(
              height: 1,
              thickness: 1,
              color: appColorDullPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: SizedBox(
              width: Get.width / 2.5,
              child: Text(
                LanguageConstant.defaultShippingContain.tr,
                style: commonTextStyle300(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              "T: 01234567890",
              style: TextStyle(
                fontFamily: AppConstants.fontPoppins,
                fontSize: 16,
                color: grey6D6D6D,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 52,
              width: Get.width,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                LanguageConstant.editAddress.tr,
                style: commonTextStyle300(),
              ),
              decoration: const BoxDecoration(
                color: appColorAccent,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: appColorFDF3F1,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 8,
          )
        ],
      ),
      padding: const EdgeInsets.only(
        top: 21,
        bottom: 10,
      ),
      alignment: Alignment.centerLeft,
    );
  }

  defaultShippingDesign() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              LanguageConstant.defaultShippingAddress.tr,
              style: commonTextStyle600(fontSize: 18.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
            child: Divider(
              height: 1,
              thickness: 1,
              color: appColorDullPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: SizedBox(
              width: Get.width / 2.5,
              child: Text(
                LanguageConstant.defaultShippingContain.tr,
                style: commonTextStyle300(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              "T: 01234567890",
              style: TextStyle(
                fontFamily: AppConstants.fontPoppins,
                fontSize: 16,
                color: grey6D6D6D,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 52,
              width: Get.width,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                LanguageConstant.editAddress.tr,
                style: commonTextStyle300(),
              ),
              decoration: const BoxDecoration(
                color: appColorAccent,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: appColorFDF3F1,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 8,
          )
        ],
      ),
      padding: const EdgeInsets.only(
        top: 21,
        bottom: 10,
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
