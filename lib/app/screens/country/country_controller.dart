import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/Home/local_store_language_currency/local_store_language_currency_model.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/Home/store_config_model.dart';
import 'package:solo_luxury/data/model/Home/store_websites_model.dart';

import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';

import '../../../data/model/Home/store_views_model.dart';
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


  @override
  void onInit() {
    super.onInit();
    getStoreDataFromApi();
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
        if(mapData["currentCode"]==null){
          mapData["currentCode"] = storeViewsItem.code;
        }
        update();
        storeViewModelList!.add(storeViewsItem);
        for (int i = 0; i < storeConfigsList.value.length; i++) {
          storeConfigItem = StoreConfigModel.fromJson(storeConfigsList.value[i]);
          if (storeViewsItem.id == storeConfigItem.id) {
            currency.value = storeConfigItem.defaultDisplayCurrencyCode!;
            if(mapData["currentCurrency"]==null){
              mapData["currentCurrency"] = storeConfigItem.baseCurrencyCode;
            }
            update();
            StoreLanguageCurrencyModel storeModel = StoreLanguageCurrencyModel(
                id: storeConfigItem.id,
                locale: storeConfigItem.locale,
                baseCurrencyCode: storeConfigItem.baseCurrencyCode,
                defaultDisplayCurrencyCode: storeConfigItem.defaultDisplayCurrencyCode);
            storeLanguageCurrencyModelList!.add(storeModel);
          }
        }
      }
    }

    mapData!.addAll({
      "store_view_model": (storeViewModelList!),
      "store_language_currency_model": (storeLanguageCurrencyModelList!)
    });

    //LocalStoreModel localStoreModel = LocalStoreModel.fromJson(mapData);
    String? data = json.encode(mapData);
    LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
    await setPrefStringValue(key_local_store_model, jsonEncode(localStoreModel));
    data = await getPrefStringValue(key_local_store_model);
    localStoreModel = LocalStoreModel.fromJson(jsonDecode(data!));
    print("LocalMap -> ${jsonEncode(localStoreModel)}");
  }
}
