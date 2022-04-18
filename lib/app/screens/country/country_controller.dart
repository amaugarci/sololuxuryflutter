import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_language_currency_model.dart';
import 'package:solo_luxury/data/model/country/store_config_model.dart';
import 'package:solo_luxury/data/model/country/store_websites_model.dart';
import 'package:solo_luxury/main.dart';

import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/country/store_views_model.dart';
import '../../../data/model/country/local_store_language_currency/local_store_model.dart';
import '../../db/shared_pref.dart';

class CountryController extends GetxController {
  RxList storeWebsitesList = [].obs;
  RxList storeViewsList = [].obs;
  RxList storeConfigsList = [].obs;

  //LocalStoreLanguageCurrencyModel? localStoreLanguageCurrencyModel;

  CountryAPIRepository countryAPIRepository;
  String? countryCode;
  String? selectPopUp = "0";
  RxBool isChangeLanguage = false.obs;
  RxBool isChangeCurrency = false.obs;

  CountryController(
      {required this.countryAPIRepository, this.countryCode, this.selectPopUp});

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  // RxString currency = "INR".obs;
  // RxString language = "English".obs;
  RxInt id = 1.obs;

  RxList rxLanguageList = [].obs;
  RxList rxCurrencyList = [].obs;

  final langSelected = "English".obs;

  final currencySelected = "EUR".obs;
  LocalStoreModel? localStoreModel;

  RxInt languageSelectIndex = 0.obs;
  RxInt currencySelectIndex = 0.obs;

  void setLanguageSelected(String value) {
    langSelected.value = value;
    //changeLanguage(value);
    update();
  }

  void setCurrencySelected(String value) {
    currencySelected.value = value;
    //changeCurrency(value);
    update();
  }

  @override
  void onInit() {
    print("Value Is Set ${selectPopUp}");
    super.onInit();
    getStoreDataFromApi();
    getCurrentLanguageCurrency();
  }

  getCurrentLanguageCurrency() async {
    String data = await getPrefStringValue(key_local_store_model);
    if (data != null && data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data));
      print("Get LocalMap -> ${jsonEncode(localStoreModel)}");

      for (var element in localStoreModel.storeViewModelList!) {
        if (element.code == localStoreModel.currentCode) {
          langSelected.value = element.name!;
          print("Languages -> ${langSelected.value}");
        }
      }
      currencySelected.value = localStoreModel.currentCurrency!;
      rxLanguageList.value = localStoreModel.languageList!;
      rxCurrencyList.value = localStoreModel.currencyList!;
      update();
    }
    localStore.getStore();
  }

  getStoreDataFromApi() async {
    print("getStoreDataFromApi -> ");
    storeWebsitesList.value = [];
    storeViewsList.value = [];
    storeConfigsList.value = [];
    var data = await countryAPIRepository.getStoreWebsitesAPIResponse();
    if (data != null) {
      String dataString = jsonEncode(data);
      storeWebsitesList.value = jsonDecode(dataString);
      print("Store Value Is ${storeWebsitesList}");
    }
    var data1 = await countryAPIRepository.getStoreViewsAPIResponse();
    if (data1 != null) {
      String dataString = jsonEncode(data1);
      storeViewsList.value = jsonDecode(dataString);
      print("storeViewsList Value Is ${storeViewsList}");
    }
    var data2 = await countryAPIRepository.getStoreConfigsAPIResponse();
    if (data2 != null) {
      String dataString = jsonEncode(data2);
      storeConfigsList.value = jsonDecode(dataString);
      print("storeConfigsList Value Is ${storeConfigsList}");
    }
    if (countryCode != null) {
      for (int i = 0; i < storeWebsitesList.value.length; i++) {
        StoreWebSitesModel item =
            StoreWebSitesModel.fromJson(storeWebsitesList.value[i]);
        // print("isCall -> $isCall");

        if (item.code == countryCode!.toLowerCase()) {
          print("item-> ${item.toJson()}");
          setLanguageAndCurrency(item, true);
          break;
        }
      }
    }
  }

  Future<void> setLanguageAndCurrency(
      StoreWebSitesModel item, bool isUpdate) async {
    print(
        "Calling Langugae Cureency ---------------------------------------------------------------- ");
    print("selection Country -> ");
    List<dynamic>? languageList = [];
    List<dynamic>? currencyList = [];
    List<StoreViewsModel>? storeViewModelList = [];
    List<StoreLanguageCurrencyModel>? storeLanguageCurrencyModelList = [];
    id.value = item.id!;
    Map<String, dynamic>? mapData = {
      "id": item.id,
      "name": item.name,
    };
    StoreViewsModel? storeViewsItem;
    StoreConfigModel? storeConfigItem;
    for (int i = 0; i < storeViewsList.value.length; i++) {
      storeViewsItem = StoreViewsModel.fromJson(storeViewsList.value[i]);

      if (item.id == storeViewsItem.websiteId) {
        // print("storeViewsItem.websiteId -> ${item.id!}");
        langSelected.value = storeViewsItem.name!;
        languageList.add(storeViewsItem.name!);
        if (mapData["current_code"] == null) {
          mapData["current_code"] = storeViewsItem.code;
        }

        update();
        print("languageList -> ${languageList.length}");
        storeViewModelList.add(storeViewsItem);
        for (int i = 0; i < storeConfigsList.value.length; i++) {
          storeConfigItem =
              StoreConfigModel.fromJson(storeConfigsList.value[i]);
          if (storeViewsItem.id == storeConfigItem.id) {
            currencySelected.value =
                storeConfigItem.defaultDisplayCurrencyCode!;
            if (mapData["current_currency"] == null) {
              mapData["current_currency"] = storeConfigItem.baseCurrencyCode;
            }
            update();
            StoreLanguageCurrencyModel storeModel = StoreLanguageCurrencyModel(
                id: storeConfigItem.id,
                locale: storeConfigItem.locale,
                baseCurrencyCode: storeConfigItem.baseCurrencyCode,
                defaultDisplayCurrencyCode:
                    storeConfigItem.defaultDisplayCurrencyCode);
            storeLanguageCurrencyModelList.add(storeModel);
            currencyList.add(storeModel.baseCurrencyCode!);
            currencyList.add(storeModel.defaultDisplayCurrencyCode!);
            print("currencyList -> ${currencyList.length}");
          }
        }
      }
    }

    mapData.addAll({
      "language_list": languageList.toSet().toList(),
      "currency_list": currencyList.toSet().toList(),
      "store_view_model": (storeViewModelList),
      "store_language_currency_model": (storeLanguageCurrencyModelList)
    });
    rxLanguageList.value = languageList.toSet().toList();
    rxCurrencyList.value = currencyList.toSet().toList();
    String? data = json.encode(mapData);

    print("LocalMap -> ${jsonEncode(localStoreModel)}");
    localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    currencySelected.value = localStoreModel!.currentCurrency!;
    if (isUpdate) {
      await setPrefStringValue(
          key_local_store_model, jsonEncode(localStoreModel));
      data = await getPrefStringValue(key_local_store_model);
      localStoreModel = LocalStoreModel.fromJson(jsonDecode(data!));
      if (selectPopUp == "1") {
        print("Here is Call");
        print("Here is Call${item.code}");
        print("Here is Call${localStore.currentCode}");
        isChangeCurrency.value = false;
        Future.delayed(Duration(milliseconds: 16), () async {
          print("Here is Call222");
          await showDialog(
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
        });
      }
      print("LocalMap -> ${jsonEncode(localStoreModel)}");
      await getCurrentLanguageCurrency();
    }
  }

  changeLanguage() async {
    // String data = await getPrefStringValue(key_local_store_model);
    // LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    LocalStoreViewModel localStoreViewModel = localStoreModel!
        .storeViewModelList!
        .firstWhere((element) => element.name == langSelected.value);
    localStoreModel!.currentCode = localStoreViewModel.code;
    await setPrefStringValue(
        key_local_store_model, jsonEncode(localStoreModel));
  }

  changeCurrency() async {
    //String data = await getPrefStringValue(key_local_store_model);
    //LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    localStoreModel!.currentCurrency = currencySelected.value;
    await setPrefStringValue(
        key_local_store_model, jsonEncode(localStoreModel));
  }

  changeName(name) async {
    //String data = await getPrefStringValue(key_local_store_model);
    //LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    //LocalStoreViewModel localStoreViewModel =
    //localStoreModel!.storeViewModelList!.firstWhere((element) => element.name == name);
    localStoreModel!.name = name;
    await setPrefStringValue(
        key_local_store_model, jsonEncode(localStoreModel));
  }

  //Show Dialog
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
                      itemCount: rxLanguageList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            isChangeLanguage.value = true;
                            languageSelectIndex.value = index;
                            setLanguageSelected(
                                rxLanguageList[index].toString());
                          },
                          child: Obx(() => CommonTextOpenSans(
                                rxLanguageList.length - 1 != index
                                    ? "${rxLanguageList[index].toString().toUpperCase()} / "
                                    : rxLanguageList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: languageSelectIndex.value == index
                                    ? appColorPrimary
                                    : Colors.black,
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
                      itemCount: rxCurrencyList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            isChangeCurrency.value = true;
                            currencySelectIndex.value = index;
                            setCurrencySelected(
                                rxCurrencyList[index].toString());
                          },
                          child: Obx(() => CommonTextOpenSans(
                                rxCurrencyList.length - 1 != index
                                    ? "${rxCurrencyList[index].toString().toUpperCase()} / "
                                    : rxCurrencyList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: currencySelectIndex.value == index
                                    ? appColorPrimary
                                    : Colors.black,
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
                    print("Language -> ${isChangeLanguage.value}");
                    print("Currency -> ${isChangeCurrency.value}");
                    if (!isChangeLanguage.value) {
                      langSelected.value = rxLanguageList.first.toString();
                    }
                    if (!isChangeCurrency.value) {
                      currencySelected.value = rxCurrencyList.first.toString();
                    }
                    await changeName(item.name);
                    await changeLanguage();
                    await changeCurrency();
                    await getCurrentLanguageCurrency();
                    languageSelectIndex.value = 0;
                    currencySelectIndex.value = 0;
                    isChangeLanguage.value = false;
                    isChangeCurrency.value = false;
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
                    languageSelectIndex.value = 0;
                    currencySelectIndex.value = 0;
                    isChangeLanguage.value = false;
                    isChangeCurrency.value = false;
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
