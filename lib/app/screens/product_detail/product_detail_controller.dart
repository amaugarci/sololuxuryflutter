import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Product/product_model.dart';
import '../../utils/global_singlton.dart';
import 'option/option_model.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /* final RecommendedProductsAPIRepository? recommendedProductsAPIRepository;

  ProductDetailController({ this.recommendedProductsAPIRepository});*/

  Rx<Item>? product = Item().obs;

  RxBool isLoading = true.obs;
  RxList<Item> recentlyItemsData = <Item>[].obs;

  var recommendedProductModel = RecommendedProductModel().obs;

  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final sizeController = TextEditingController().obs;
  var slectSize = "".obs;
  var sizeList = "".obs;
  // List sizeList = [];

  // SpecialSizeAPIRepository specialSizeAPIRepository;

  RxInt frameIndex = 0.obs;
  PageController controllerPage = PageController(initialPage: 0);

  @override
  void onInit() {
    // TODO: implement onInit
    getSizeListFromApi();
    product?.value = Get.arguments[0];
    super.onInit();
    getRecommendedProductDataFromApi();
   // getRecentlyViewProduct ();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  onRecommended(){
    getSizeListFromApi();
    getRecommendedProductDataFromApi();
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

  RxList itemsData = [].obs;
  List sizeListData = [].obs;
  var getCartId = 0.obs;
  var getCartToken = "".obs;

  // Future getRecentlyViewProduct () async {
  //   isLoading(true);
  //   print("this is recent ${await getPrefRecentlyValue(AppConstants.recentlyProduct)}");
  //   List<dynamic> convertedData = jsonDecode(await getPrefRecentlyValue(AppConstants.recentlyProduct));
  //     print(convertedData.runtimeType);
  //     convertedData.forEach((element) {
  //       print(element.runtimeType);
  //     });
  //   recentlyItemsData.value = List<Item>.from(convertedData.map((x) => Item.fromJson(x)));
  //   isLoading(false);
  // }

  Future getProductDetail () async {
    isLoading(true);
    product?.value  = await RecommendedProductsAPIRepository()
        .getProductDetailApi(product!.value.sku.toString());
    isLoading(false);
  }

  ///API CALLING
  Future<void> getRecommendedProductDataFromApi() async {
    isLoading(true);
    try {
      itemsData.value = await RecommendedProductsAPIRepository()
          .getRecommendedProductResponse(product!.value.sku.toString());
      if (itemsData != null) {
        isLoading(false);
        // recommendedProductModel(itemsData);
        print("CONTROLLER DATA ==============${itemsData[0]["type_id"]}");
      }
    } catch (e) {
      print("CONTROLLER DATA ==============$e");
      isLoading(false);
    }
  }

  Future<void> getSizeListFromApi() async {
    isLoading(true);
    try {
      // sizeListData =
      //     await RecommendedProductsAPIRepository().getSizeListApi("539");
      sizeListData = await RecommendedProductsAPIRepository()
          .getSizeListApi(product!.value.id.toString());

      print("Size List $sizeListData");
      if (sizeListData != null) {
        isLoading(false);
      }
    } catch (e) {
      print("CONTROLLER DATA ==============$e");
      isLoading(false);
    }
  }

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

  //Add TO WishList Api Calling
  postAddToWishlistData(context, dataName, customImage, sku) async {
    var addToWishData;
    print("Here Customer Post");
    addToWishData = await RecommendedProductsAPIRepository()
        .addTOWishListProductResponse(sku);

    print("Add To Cart Data ${addToWishData}");
    if (addToWishData) {
      return showWishlistDialog(context, dataName, customImage);
    }
  }

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

  //show Wish List Add
  //ShowDialog For Confomation
  void showWishlistDialog(var context, dataname, customimage) {
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
                      LanguageConstant.youaddWishEndText.tr,
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
                                            LanguageConstant.viewWishListText.tr
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
                                              RoutesConstants.wishlistScreen);
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

  // getSizeListApi() async {
  //   dynamic authResponse =
  //       await RecommendedProductsAPIRepository.getSizeListApi("539");
  //   print("^^^^^^^&&&&******$authResponse");
  //   sizeList = authResponse;
  // }

  // postSpecialSize(context, formKey) async {
  //   final website = "www.sololuxury.com";
  //   dynamic authResponse =
  //       await specialSizeAPIRepository.postspecialSizeApiResponse(
  //           website, emailController.value.text, slectSize.value);
  //   print("Response Is $authResponse");
  // }

  //Missing SIze Dialog Merge
  showDialogBoxOpen(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            // title:
            backgroundColor: Color(0xFFF9EAE3),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            content: Form(
              // key: formKey.value,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.transparent,
                    ),
                    Text(
                      LanguageConstant.specialSizeRequestsText.tr,
                      style: const TextStyle(
                          color: appColor, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: appColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: double.maxFinite,
                  height: 1,
                  color: Color(0xFFDEC5B9),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: emailController.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 10),
                      hintText: LanguageConstant.specialSizeEnterEmailText.tr,
                      hintStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                      labelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                      errorStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFDEC5B9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFDEC5B9),
                          width: 1.0,
                        ),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDEC5B9),
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Enter Email";
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15.6,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(0.0),
                      border:
                          Border.all(color: const Color(0xFFDEC5B9), width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: sizeListData
                            .map(
                              (value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: slectSize.toString() == ""
                            ? Text(
                                LanguageConstant.specialSizeSelectSizeText.tr,
                                style:
                                    const TextStyle(color: Color(0xFF6B6B6B)),
                              )
                            : Text(
                                "${slectSize}",
                                style:
                                    const TextStyle(color: Color(0xFF6B6B6B)),
                              ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: appColor,
                        ),
                        iconEnabledColor: Colors.transparent,
                        onChanged: (value) {
                          slectSize.value = value.toString();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                InkWell(
                  onTap: () {
                    RecommendedProductsAPIRepository().postspecialSizeResponse(
                        website: "www.sololuxury.com",
                        email: emailController.value.text,
                        sku: slectSize.value);
                  },
                  child: Text(
                    LanguageConstant.specialSizeSubmitText.tr,
                    style: const TextStyle(
                      color: appColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ]),
            ),
          ),
        );
      },
    );
  }
}
