import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/product_list_api_repository.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../data/model/filter/filter_model.dart';
import '../product_detail/product_detail_binding.dart';

class ProductController extends GetxController {
  var likedProducts = <ProductModel>[].obs;
  var selectedIndex = 0.obs;
  var activeProduct = ProductModel().obs;
  var isLoading = true.obs;
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;

  var homeCategoryProductList = <ProductModel>[].obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<ProductModel>? productModel = ProductModel().obs;
  final ProductListAPIRepository productListAPIRepository;

  ProductController({required this.productListAPIRepository});

  //Filter
  RxBool isFilter = false.obs;
  // var isLoading = true.obs;

  // RxInt checked = 0.obs;
  RxInt currentCategoryIndex = 0.obs;
  RxList filterList = [].obs;
  Rx<FilterModel>? filterModel = FilterModel().obs;
  RxList<FilterModel>? filterModelList = <FilterModel>[].obs;
  RxList<FilterModel>? saveFilterModelList = <FilterModel>[].obs;
  RxList<Category>? subCategoryList = <Category>[].obs;
  RxList<Category>? saveSubCategoryList = <Category>[].obs;
  Rx<TextEditingController> searchEditingController =
      TextEditingController().obs;

  @override
  void onInit() {
    getHomeProducts(Get.arguments[0].toString());
    print("Id -> ${Get.arguments[0]}");
    print("Name -> ${Get.arguments[1]}");
    ProductDetailsBindings().dependencies();
    getFilterData();
    super.onInit();
  }

  getHomeProducts(String val) async {
    isLoading.value = true;
    productModel?.value =
        await productListAPIRepository.getProductListApiResponse(val);
    isLoading.value = false;
  }

  getFilterData() async {
    filterList.value =
        await productListAPIRepository.getFilterListApiResponse();
    print("filterList.value -> ${filterList.length}");
    if (filterList.isNotEmpty) {
      for (int i = 0; i < filterList.length; i++) {
        filterModelList!.add(FilterModel.fromJson(filterList[i]));
      }
      saveFilterModelList = filterModelList!;
      filterModel!.value = filterModelList!.first;
      print("model -> ${filterModel?.value.toJson()}");
      subCategoryList?.value = filterModel!.value.category!;
      saveSubCategoryList?.value = filterModel!.value.category!;
    }
  }

  changedData(int index) {
    currentCategoryIndex.value = index;
    searchEditingController.value.text = "";
    for (int i = 0; i < filterModelList!.length; i++) {
      if (i == currentCategoryIndex.value) {
        filterModel!.value = filterModelList![i];
        print("model->${filterModel!.value.toJson()}");
        subCategoryList!.value = filterModel!.value.category!;
        saveSubCategoryList!.value = filterModel!.value.category!;
      }
    }
  }

  searchFilter(String itemTitle) {
    List<Category> results = [];
    if (itemTitle.isNotEmpty) {
      subCategoryList!.value = saveSubCategoryList!;
      results = subCategoryList!
          .where((element) => element.display!
              .toLowerCase()
              .toString()
              .contains(itemTitle.toLowerCase()))
          .toList();
      subCategoryList!.value = results;
      print(
          "Results: ${results.length.toString()} ${subCategoryList!.length.toString()}");
    } else {
      for (int i = 0; i < filterModelList!.length; i++) {
        if (i == currentCategoryIndex.value) {
          filterModel!.value = filterModelList![i];
          subCategoryList!.value = filterModel!.value.category!;
        }
      }
    }
  }
}
