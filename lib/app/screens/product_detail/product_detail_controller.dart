import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /* final RecommendedProductsAPIRepository? recommendedProductsAPIRepository;

  ProductDetailController({ this.recommendedProductsAPIRepository});*/

  RxBool isLoading = true.obs;

  var recommendedProductModel = RecommendedProductModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRecommendedProductDataFromApi();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: LanguageConstant.recommendation.tr),
    Tab(text: LanguageConstant.recentlyViewed.tr),
  ];

  late TabController controller;

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;

  ///API CALLING
  Future<void> getRecommendedProductDataFromApi() async {
    isLoading(true);
    try {
      var itemsData = await RecommendedProductsAPIRepository()
          .getRecommendedProductResponse();
      if (itemsData != null) {
        isLoading(false);
        recommendedProductModel(itemsData);
      }
      print(recommendedProductModel.value.price);
    } catch (e) {
      isLoading(false);
    }
  }
}
