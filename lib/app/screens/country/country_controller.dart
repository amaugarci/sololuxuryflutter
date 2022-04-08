import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_language_currency_model.dart';
import 'package:solo_luxury/data/model/country/store_config_model.dart';
import 'package:solo_luxury/data/model/country/store_websites_model.dart';
import 'package:solo_luxury/main.dart';

import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';

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
  RxBool isChangeLanguage = false.obs;
  RxBool isChangeCurrency = false.obs;

  CountryController({required this.countryAPIRepository, this.countryCode});

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
    super.onInit();
    getStoreDataFromApi();
    getCurrentLanguageCurrency();
  }

  getCurrentLanguageCurrency() async {
    String data = await getPrefStringValue(key_local_store_model);
    if (data != null && data.isNotEmpty) {
      LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
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
    if(data!=null){
      String dataString = jsonEncode(data);
      storeWebsitesList.value = jsonDecode(dataString);
    }
    var data1 = await countryAPIRepository.getStoreViewsAPIResponse();
    if(data1!=null){
      String dataString = jsonEncode(data1);
      storeViewsList.value = jsonDecode(dataString);
    }
    var data2 = await countryAPIRepository.getStoreConfigsAPIResponse();
    if(data2!=null){
      String dataString = jsonEncode(data2);
      storeConfigsList.value = jsonDecode(dataString);
    }
    if(countryCode!=null) {
      for (int i = 0; i < storeWebsitesList.value.length; i++) {
        StoreWebSitesModel item = StoreWebSitesModel.fromJson(storeWebsitesList.value[i]);
        if (item.code == countryCode!.toLowerCase()) {
          print("item-> ${item.toJson()}");
          setLanguageAndCurrency(item,true);
          break;
        }
      }
    }
  }

  Future<void> setLanguageAndCurrency(StoreWebSitesModel item, bool isUpdate) async {
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
          storeConfigItem = StoreConfigModel.fromJson(storeConfigsList.value[i]);
          if (storeViewsItem.id == storeConfigItem.id) {
            currencySelected.value = storeConfigItem.defaultDisplayCurrencyCode!;
            if (mapData["current_currency"] == null) {
              mapData["current_currency"] = storeConfigItem.baseCurrencyCode;
            }
            update();
            StoreLanguageCurrencyModel storeModel = StoreLanguageCurrencyModel(
                id: storeConfigItem.id,
                locale: storeConfigItem.locale,
                baseCurrencyCode: storeConfigItem.baseCurrencyCode,
                defaultDisplayCurrencyCode: storeConfigItem.defaultDisplayCurrencyCode);
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
    if(isUpdate) {
      await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
      data = await getPrefStringValue(key_local_store_model);
      localStoreModel = LocalStoreModel.fromJson(jsonDecode(data!));
      print("LocalMap -> ${jsonEncode(localStoreModel)}");
      await getCurrentLanguageCurrency();
    }
  }

  changeLanguage() async {
    // String data = await getPrefStringValue(key_local_store_model);
    // LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    LocalStoreViewModel localStoreViewModel =
        localStoreModel!.storeViewModelList!.firstWhere((element) => element.name == langSelected.value);
    localStoreModel!.currentCode = localStoreViewModel.code;
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
  }

  changeCurrency() async {
    //String data = await getPrefStringValue(key_local_store_model);
    //LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    localStoreModel!.currentCurrency = currencySelected.value;
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
  }

  changeName(name) async {
    //String data = await getPrefStringValue(key_local_store_model);
    //LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    //LocalStoreViewModel localStoreViewModel =
    //localStoreModel!.storeViewModelList!.firstWhere((element) => element.name == name);
    localStoreModel!.name = name;
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
  }
}
