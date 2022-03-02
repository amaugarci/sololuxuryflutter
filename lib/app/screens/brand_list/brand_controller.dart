import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/BrandData.dart';
import 'package:solo_luxury/data/requests/brand_list_request.dart';

class BrandController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var brandList = <BrandData>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBrandList();
  }

  void getBrandList() async {
    List<BrandData>? brands =
        (await BrandListRequest.fetchBrands()).cast<BrandData>();
    if (brands != null) {
      brandList.value = brands;
    }
  }
}
