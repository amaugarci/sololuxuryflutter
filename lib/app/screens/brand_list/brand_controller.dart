import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/BrandData.dart';
import 'package:solo_luxury/data/requests/brand_list_request.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/brand_list_api_repository.dart';

class BrandController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var brandList = [].obs;

  final BrandListAPIRepository brandListAPIRepository;
  BrandController({required this.brandListAPIRepository});


  @override
  void onInit() {
    super.onInit();
    getBrandList();
  }

  void getBrandList() async {
    List<BrandData> data = await brandListAPIRepository.getBrandDataApiResponse();
    if(data != null) {
      brandList.value = data;
    }
  }
}
