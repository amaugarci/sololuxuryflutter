import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';

class SelectCountryController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;

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

  @override
  void onInit() {
    super.onInit();
  }
}
