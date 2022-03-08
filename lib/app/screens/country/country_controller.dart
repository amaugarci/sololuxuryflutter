import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_language_currency_model.dart';
import 'package:solo_luxury/data/model/country/store_config_model.dart';
import 'package:solo_luxury/data/model/country/store_websites_model.dart';

import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';

import '../../../data/model/country/store_views_model.dart';
import '../../../data/model/local_store/local_store_model.dart';
import '../../db/shared_pref.dart';

class CountryController extends GetxController {
  RxList storeWebsitesList = [].obs;
  RxList storeViewsList = [].obs;
  RxList storeConfigsList = [].obs;
  //LocalStoreLanguageCurrencyModel? localStoreLanguageCurrencyModel;


  CountryAPIRepository countryAPIRepository;

  CountryController({required this.countryAPIRepository});

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  RxString currency = "INR".obs;
  RxString language = "English".obs;
  RxInt id = 1.obs;

  RxList languageList = [].obs;
  RxList currencyList = [].obs;

  final langSelected = "English".obs;

  final currencySelected = "EUR".obs;
  void setLanguageSelected(String value){
    langSelected.value = value;
    changeLanguage(value);
    update();
  }

  void setCurrencySelected(String value){
    currencySelected.value = value;
    changeCurrency(value);
    update();
  }


  @override
  void onInit() {
    super.onInit();
    getStoreDataFromApi();
    getCurrentLanguageCurrency();
  }

  getCurrentLanguageCurrency()async {
    String data = await getPrefStringValue(key_local_store_model);
    if(data!=null && data.isNotEmpty) {
      LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
      print("Get LocalMap -> ${jsonEncode(localStoreModel)}");
      for (var element in localStoreModel.storeViewModelList!) {
        if (element.code == localStoreModel.currentCode) {
          langSelected.value = element.name!;
          print("Languages -> ${language.value}");
        }
      }
      currencySelected.value = localStoreModel.currentCurrency!;
      languageList.value = localStoreModel.languageList!;
      currencyList.value = localStoreModel.currencyList!;
      update();
    }
  }

  getStoreDataFromApi() async {
    print("getStoreDataFromApi -> ");
    storeWebsitesList.value = [];
    storeViewsList.value = [];
    storeConfigsList.value = [];
    storeWebsitesList.value = jsonDecode(await countryAPIRepository.getStoreWebsitesAPIResponse());
    storeViewsList.value = jsonDecode(await countryAPIRepository.getStoreViewsAPIResponse());
    storeConfigsList.value = jsonDecode(await countryAPIRepository.getStoreConfigsAPIResponse());
  }

  Future<void> setLanguageAndCurrency(StoreWebSitesModel item) async {
    print("selection Country -> ");
    List<dynamic>? languageList = [];
    List<dynamic>? currencyList = [];
    List<StoreViewsModel>? storeViewModelList = [];
    List<StoreLanguageCurrencyModel>? storeLanguageCurrencyModelList = [];
    language.value = item.name!;
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
        language.value = storeViewsItem.name!;
        languageList.add(storeViewsItem.name!);
        if(mapData["current_code"]==null){
          mapData["current_code"] = storeViewsItem.code;
        }

        update();
        print("languageList -> ${languageList.length}");
        storeViewModelList.add(storeViewsItem);
        for (int i = 0; i < storeConfigsList.value.length; i++) {
          storeConfigItem = StoreConfigModel.fromJson(storeConfigsList.value[i]);
          if (storeViewsItem.id == storeConfigItem.id) {
            currency.value = storeConfigItem.defaultDisplayCurrencyCode!;
            if(mapData["current_currency"]==null){
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

    //LocalStoreModel localStoreModel = LocalStoreModel.fromJson(mapData);
    String? data = json.encode(mapData);
    LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
    data = await getPrefStringValue(key_local_store_model);
    localStoreModel = LocalStoreModel.fromJson(jsonDecode(data!));
    print("LocalMap -> ${jsonEncode(localStoreModel)}");
    await getCurrentLanguageCurrency();
  }

  changeLanguage(langValue) async {
    String data = await getPrefStringValue(key_local_store_model);
    LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    LocalStoreViewModel localStoreViewModel = localStoreModel.storeViewModelList!.firstWhere((element) => element.name==langValue);
    localStoreModel.currentCode = localStoreViewModel.code;
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
    await getCurrentLanguageCurrency();
  }

  changeCurrency(currencyValue) async {
    String data = await getPrefStringValue(key_local_store_model);
    LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    localStoreModel.currentCurrency = currencyValue;
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
    await getCurrentLanguageCurrency();
  }
}
