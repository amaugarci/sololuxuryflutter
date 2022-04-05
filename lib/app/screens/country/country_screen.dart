import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../data/model/country/store_websites_model.dart';
import '../../../utils/lang_directory/language_constant.dart';
import '../../components/common_widget/common_appbar.dart';
import '../../components/common_widget/common_button.dart';
import '../../components/common_widget/common_text_opensans.dart';

class CountryScreen extends GetView<CountryController> {
  CountryScreen({Key? key}) : super(key: key);

  MyAccountController myAccountController = Get.find<MyAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          appBar: commonAppbar(title: "Change Language and Currency"),
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
                                controller.isChangeCurrency.value = false;
                                await controller.setLanguageAndCurrency(item, false);

                                // Get.defaultDialog(
                                //     title: LanguageConstant.selectLangCurrText.tr,
                                //     middleText: LanguageConstant.selectLangCurrDescText.tr,
                                //     backgroundColor: appSubscribeButtonColor,
                                //     titleStyle: const TextStyle(color: appColorPrimary,fontSize: 14.0,fontFamily: 'OpenSans'),
                                //     middleTextStyle: const TextStyle(color: Colors.white),
                                //     contentPadding: EdgeInsets.zero,
                                //     radius: 2,
                                //     onConfirm: () async {
                                //       await controller.changeName(item.name);
                                //       await controller.changeLanguage();
                                //       await controller.changeCurrency();
                                //       await controller.getCurrentLanguageCurrency();
                                //       profileController.countryCurrency.value =
                                //           "${controller.localStoreModel!.name} (${controller.localStoreModel!.currentCurrency})";
                                //       Get.back();
                                //     },
                                //     onCancel: () {
                                //       // controller.setLanguageAndCurrency(item);
                                //     },
                                //     content: Column(
                                //       children: [
                                //         Obx(() {
                                //           return Container(
                                //             padding: const EdgeInsets.only(left: 20.0),
                                //             child: DropdownButton(
                                //               focusColor: appColorButton,
                                //               hint: CommonTextPoppins(''),
                                //               onChanged: (language) {
                                //                 controller.setLanguageSelected(language.toString());
                                //               },
                                //               value: controller.langSelected.value,
                                //               items: controller.rxLanguageList.map((languageSelect) {
                                //                 return DropdownMenuItem(
                                //                   child: CommonTextPoppins(
                                //                     languageSelect,
                                //                     fontSize: 18.0,
                                //                   ),
                                //                   value: languageSelect,
                                //                 );
                                //               }).toList(),
                                //             ),
                                //           );
                                //         }),
                                //         Obx(() {
                                //           return Container(
                                //             padding: const EdgeInsets.only(left: 20.0),
                                //             child: DropdownButton(
                                //               focusColor: appColorButton,
                                //               hint: CommonTextPoppins(''),
                                //               onChanged: (currency) {
                                //                 controller.setCurrencySelected(currency.toString());
                                //               },
                                //               value: controller.currencySelected.value,
                                //               items: controller.rxCurrencyList.map((currencySelect) {
                                //                 return DropdownMenuItem(
                                //                   child: CommonTextPoppins(
                                //                     currencySelect,
                                //                     fontSize: 18.0,
                                //                   ),
                                //                   value: currencySelect,
                                //                 );
                                //               }).toList(),
                                //             ),
                                //           );
                                //         }),
                                //       ],
                                //     ));
                                showDialog(
                                  context: Get.context!,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: const EdgeInsets.all(10),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Container(
                                                width: double.infinity,
                                                color: appSubscribeButtonColor,
                                                padding: const EdgeInsets.all(20.0),
                                                child: dialogContent(item)),
                                          ],
                                        ));
                                  },
                                );
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

  Widget dialogContent(StoreWebSitesModel item) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextOpenSans(
            LanguageConstant.selectLangCurrText.tr,
            fontSize: 14,
            textAlign: TextAlign.center,
            color: appColorPrimary,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 15.0),
          CommonTextOpenSans(
            LanguageConstant.selectLangCurrDescText.tr,
            fontSize: 12,
            textAlign: TextAlign.center,
            color: Colors.black,
          ),
          const SizedBox(height: 15.0),
          Container(
            width: Get.width,
            height: 20.0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextOpenSans(
                  "${LanguageConstant.languageText.tr} : ",
                  fontSize: 12,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.rxLanguageList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.isChangeLanguage.value = true;
                            controller.languageSelectIndex.value = index;
                            controller.setLanguageSelected(controller.rxLanguageList[index].toString());
                          },
                          child: Obx(() => CommonTextOpenSans(
                                controller.rxLanguageList.length - 1 != index
                                    ? "${controller.rxLanguageList[index].toString().toUpperCase()} / "
                                    : controller.rxLanguageList[index].toString().toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.languageSelectIndex.value == index ? appColorPrimary : Colors.black,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            width: Get.width,
            height: 20.0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextOpenSans(
                  "${LanguageConstant.currencyText.tr} : ",
                  fontSize: 12,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.rxCurrencyList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.isChangeCurrency.value = true;
                            controller.currencySelectIndex.value = index;
                            controller.setCurrencySelected(controller.rxCurrencyList[index].toString());
                          },
                          child: Obx(() => CommonTextOpenSans(
                                controller.rxCurrencyList.length - 1 != index
                                    ? "${controller.rxCurrencyList[index].toString().toUpperCase()} / "
                                    : controller.rxCurrencyList[index].toString().toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.currencySelectIndex.value == index ? appColorPrimary : Colors.black,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.0,
                child: CommonButton(
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
                    print("Language -> ${controller.isChangeLanguage.value}");
                    print("Currency -> ${controller.isChangeCurrency.value}");
                    if (!controller.isChangeLanguage.value) {
                      controller.langSelected.value = controller.rxLanguageList.first.toString();
                    }
                    if (!controller.isChangeCurrency.value) {
                      controller.currencySelected.value = controller.rxCurrencyList.first.toString();
                    }
                    await controller.changeName(item.name);
                    await controller.changeLanguage();
                    await controller.changeCurrency();
                    await controller.getCurrentLanguageCurrency();
                    myAccountController.countryCurrency.value =
                        "${controller.localStoreModel!.name} (${controller.localStoreModel!.currentCurrency})";
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back();
                  },
                  elevation: 0.0,
                  color: appColorPrimary,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextOpenSans(
                      LanguageConstant.saveText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 35.0,
                child: CommonButton(
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back();
                  },
                  elevation: 0.0,
                  color: appColorPrimary,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextOpenSans(
                      LanguageConstant.cancelText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
