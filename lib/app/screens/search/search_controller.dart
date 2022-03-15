import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/home_api_repository.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  final HomeAPIRepository homeAPIRepository;

  SearchController({required this.homeAPIRepository});

  RxObjectMixin? menuModel = MenuModel().obs;
  RxObjectMixin? bannerList = BannerListModel().obs;

  RxList list = [].obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMenuDataFromApi();
  }

  getMenuDataFromApi() async {
    isLoading(true);
    print("CONTROLLER DATA ==============${menuModel}");
    // menuModel!.value = await homeAPIRepository.getMenuAPIResponse();
    // bannerList!.value = await homeAPIRepository.getBannerListAPIResponse();
  }
}
