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

class CountryController extends GetxController {
  RxList storeWebsitesList = [].obs;
  RxList storeViewsList = [].obs;
  RxList storeConfigsList = [].obs;
  LocalStoreLanguageCurrencyModel? localStoreLanguageCurrencyModel;
  Map<String, dynamic>? localStoreLanguageCurrencyParams;

  CountryAPIRepository countryAPIRepository;

  CountryController({required this.countryAPIRepository});

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  RxString currency = "INR".obs;
  RxString language = "English".obs;
  RxInt id = 1.obs;
  List<StoreViewsModel>? storeViewModelList = [];
  List<StoreLanguageCurrencyModel>? storeLanguageCurrencyModelList = [];

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

  void setLanguageAndCurrency(StoreWebSitesModel item) {
    print("selection Country -> ");
    storeViewModelList = [];
    storeLanguageCurrencyModelList = [];
    language.value = item.name!;
    id.value = item.id!;
    localStoreLanguageCurrencyParams = {
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
        update();
        storeViewModelList!.add(storeViewsItem);
        for (int i = 0; i < storeConfigsList.value.length; i++) {
          storeConfigItem = StoreConfigModel.fromJson(storeConfigsList.value[i]);
          if (storeViewsItem.id == storeConfigItem.id) {
            currency.value = storeConfigItem.defaultDisplayCurrencyCode!;
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

    localStoreLanguageCurrencyParams!.addAll({
      "store_view_model": storeViewsModelToJson(storeViewModelList!),
      "store_language_currency_model": storeLanguageCurrencyToJson(storeLanguageCurrencyModelList!)
    });

    print("LocalMap -> $localStoreLanguageCurrencyParams");
    print("LocalMap -> ${storeViewModelList!.length}");
    print("LocalMap -> ${storeLanguageCurrencyModelList!.length}");
  }
}
