import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/product_list_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../data/model/filter/filter_model.dart';
import '../../../main.dart';
import '../../utils/global_singlton.dart';
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
  var getCartId = 0.obs;
  var getCartToken = "".obs;

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
    await getOptionsFromAPI();
    productModel?.value =
        await productListAPIRepository.getProductListApiResponse(val);
    isLoading.value = false;
  }

  getOptionsFromAPI() async {
    if (GlobalSingleton().optionList.isEmpty) {
      GlobalSingleton().optionList =
          await productListAPIRepository.getOptionsListApiResponse();
    }
    print("OptionList -> ${GlobalSingleton().optionList.length}");
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

  deleteWishListData(context, dataName, customImage, sku, getId, index) async {
    var deleteToWishData;
    deleteToWishData =
        await RecommendedProductsAPIRepository().deleteWishList(getId);

    print("Delete ID  To Cart Data ${deleteToWishData}");
    if (deleteToWishData) {
      productModel!.value.items![index].isWishList.value = false;
      // return showWishlistDialog(context, dataName, customImage);
    } else {
      productModel!.value.items![index].isWishList.value = false;
    }
  }

  postAddToWishlistData(context, dataName, customImage, sku, index) async {
    var addToWishData;
    print("Here Customer Post");
    addToWishData = await RecommendedProductsAPIRepository()
        .addTOWishListProductResponse(sku);

    print("Add To Cart Data ${addToWishData}");
    if (addToWishData) {
      productModel!.value.items![index].isWishList.value = true;
      // return showWishlistDialog(context, dataName, customImage);
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

  //Add TO cart Apis ------------------------------
  Future<void> getGenerateCart(context, dataName, customImage, sku) async {
    print("User Token Is ${localStore.customerToken}");
    if (localStore.customerToken.toString() != "") {
      print("Customer");
      getCartId.value = await RecommendedProductsAPIRepository()
          .getGenerateCartApiResponse(
              localStore.customerToken, AppConstants.createCart);
      print("Generate ${getCartId.value}");
      getCartToken.value = getCartId.value.toString();

      if (getCartToken.value != null) {
        postAddToCartData(
            context, dataName, customImage, sku, "1", getCartToken.value);
      } else {}
    } else {
      print("Guest");
      getCartToken.value = await RecommendedProductsAPIRepository()
          .getGenerateCartApiResponse(
              localStore.customerToken, AppConstants.guestCreateCart);
      print("Generate ${getCartId.value}");
      if (getCartToken.value != null) {
        postAddToCartData(
            context, dataName, customImage, sku, "2", getCartToken.value);
      } else {}
    }
    print("Create Cart ID Is ${getCartId.value}");
  }

  //Add TO Cart Api Calling
  getApiCallingForCreteCart() async {
    var addTocartData =
        await RecommendedProductsAPIRepository().getCreateCartApiResponse();
    Get.toNamed(RoutesConstants.cartScreen);
    print("Response $addTocartData");
  }

  //Add TO Cart Api Calling
  postAddToCartData(
      context, dataName, customImage, sku, getValue, getToken) async {
    var passedAddTocart = {
      "cartItem": {"sku": "$sku", "qty": 1, "quote_id": "$getToken"}
    };
    var addTocartData;
    if (getValue == "1") {
      print("Here Customer Post");
      addTocartData = await RecommendedProductsAPIRepository()
          .postAddTOCartProductResponse(passedAddTocart);
    } else {
      print("Here Guest Post");
      addTocartData = await RecommendedProductsAPIRepository()
          .guestPostAddTOCartProductResponse(passedAddTocart, getToken);
    }
    print("Add To Cart Data ${addTocartData}");
    if (addTocartData['message'] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(addTocartData['message'])),
      );
    } else {
      return showAddDialog(context, dataName, customImage);
    }
  }

  //Show Add To Cart Dialog
  //ShowDialog For Confomation
  void showAddDialog(var context, dataname, customimage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          contentPadding: EdgeInsets.all(14.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          backgroundColor: Color(0xffFBECE5),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.clear,
                        size: 22,
                        color: appColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Text(
                  LanguageConstant.youaddCartText.tr +
                      " ${dataname} " +
                      LanguageConstant.youaddCartEndText.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: appColor),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          border: Border.all(color: appColor),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${AppConstants.productImageUrl}${customimage}"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14.0, vertical: 10.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: appColor),
                                          child: Text(
                                            LanguageConstant.viewCartText.tr
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        onTap: () {
                                          print("click");
                                          Get.toNamed(
                                              RoutesConstants.cartScreen);
                                          // Get.to(
                                          //   () => const CartScreen(),
                                          // );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: appColor),
                                      child: Text(
                                        LanguageConstant.continueShoppingText.tr
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 14.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
