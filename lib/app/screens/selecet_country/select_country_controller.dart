import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_list_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/select_country_api_repositry.dart';

class SelectCountryController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  RxList<CountryListModel> getSearchList = RxList<CountryListModel>();
  var isLoading = false.obs;
  var search = null.obs;
  final textController = TextEditingController().obs;

  List countryList = [
    {
      'countryName': 'Albania',
      'insideList': [
        {
          'InsideCoutryName': 'ARUBA',
        },
        {
          'InsideCoutryName': 'ARUBA2',
        },
        {
          'InsideCoutryName': 'ARUBA3',
        },
      ]
    },
    {'countryName': 'ARGENTINA', 'insideList': []},
    {'countryName': 'ARMENIA', 'insideList': []},
    {'countryName': 'AUSTRALIA', 'insideList': []},
    {'countryName': 'AUSTRIA', 'insideList': []},
    {'countryName': 'BAHAMAS', 'insideList': []},
    {'countryName': 'BAHRAIN', 'insideList': []},
    {'countryName': 'BARBADOS', 'insideList': []},
    {'countryName': 'BELARUS', 'insideList': []},
  ];

  SelectCountryAPIRepository selectCountrytAPIRepository;
  String? countryCode;

  SelectCountryController(
      {required this.selectCountrytAPIRepository, this.countryCode});
  @override
  void onInit() {
    getSelectCountryt();
    super.onInit();
  }

//CountrList
  getSelectCountryt() async {
    isLoading.value = true;
    print("getStoreDataFromApi -> ");

    var selectCountryt = jsonDecode(
        await selectCountrytAPIRepository.getSelectCountryResponse());
    getcountryList.value = List<CountryListModel>.from(selectCountryt
        .map((countryList) => CountryListModel.fromJson(countryList)));
    print("country list Get $getcountryList");
    isLoading.value = false;
  }

  //getSearch
  onSearchTextChanged(String text) async {
    print("Text is $text");
    getSearchList.clear();
    getcountryList.forEach((userDetail) {
      if (userDetail.fullNameEnglish
          .toString()
          .toUpperCase()
          .contains(text.toUpperCase())) getSearchList.add(userDetail);
      print(userDetail);
    });
  }
}
