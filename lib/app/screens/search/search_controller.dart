import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/search/get_product_data_model.dart';
import 'package:solo_luxury/data/model/search/search_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/dashboard_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/home_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/search_api_repository.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  final SearchAPIRepository searchAPIRepository;

  SearchController({required this.searchAPIRepository});

  RxObjectMixin? menuModel = MenuModel().obs;
  RxObjectMixin? bannerList = BannerListModel().obs;
  Rx<SearchModel> searchItemList = SearchModel().obs;
  Rx<ProductDetailsModel> searchProductList = ProductDetailsModel().obs;

  RxList listData = [].obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxBool isLoading = true.obs;
  final txtList = TextEditingController();
  RxString controllerText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    txtList.addListener(() {
      controllerText.value = txtList.text;
    });
    debounce(controllerText, (_) {
      print("debouce$_");
    }, time: Duration(seconds: 1));
    getMenuDataFromApi();
  }

  getMenuDataFromApi() async {
    isLoading(true);
    print("CONTROLLER DATA ==============${menuModel}");
    menuModel!.value = await searchAPIRepository.getMenuAPIResponse();
    // bannerList!.value = await searchAPIRepository.getBannerListAPIResponse();
    // menuModel!.value = await homeAPIRepository.getMenuAPIResponse();
    // bannerList!.value = await homeAPIRepository.getBannerListAPIResponse();
  }

  getSearchData({argument}) async {
    searchItemList.value =
        await searchAPIRepository.getSearchAPIResponse(argument: argument);
    getPeticulerrItem();
    getSearchProductList(itemId: listData);
    update();
  }

  getSearchProductList({itemId}) async {
    searchProductList.value =
        await searchAPIRepository.getSearchProductAPIResponse(itemID: itemId);
    update();
  }

  getPeticulerrItem() {
    listData.clear();
    print("listData===================${listData}");
    searchItemList.value.items?.forEach((element) {
      print("listData===================${element.id}");
      if (element.id != null) {
        listData.add(element.id);
        print("listDataDATATATTATA===================${listData}");
      }
    });
  }
}
