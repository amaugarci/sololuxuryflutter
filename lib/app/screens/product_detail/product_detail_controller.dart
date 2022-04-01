import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
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

  String productName = "";

  RxBool isLoading = true.obs;

  var recommendedProductModel = RecommendedProductModel().obs;

  RxInt frameIndex = 0.obs;
  PageController controllerPage = PageController(initialPage: 0);

  @override
  void onInit() {
    // TODO: implement onInit
    getSizeListFromApi();
    product?.value = Get.arguments[0];
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

  List itemsData = [];
  List sizeListData = [].obs;
  var sizeList = "".obs;

  ///API CALLING
  Future<void> getRecommendedProductDataFromApi() async {
    isLoading(true);
    try {
      itemsData = await RecommendedProductsAPIRepository()
          .getRecommendedProductResponse();
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
      sizeListData = await RecommendedProductsAPIRepository().getSizeListApi();
      print("Size List $sizeListData");
      if (sizeListData != null) {
        isLoading(false);
      }
    } catch (e) {
      print("CONTROLLER DATA ==============$e");
      isLoading(false);
    }
  }

  //Add TO Cart Api Calling
  getApiCallingForCreteCart() async {
    var addTocartData =
        await RecommendedProductsAPIRepository().getCreateCartApiResponse();
    Get.toNamed(RoutesConstants.cartScreen);
    print("Response $addTocartData");
  }

  //Add TO Cart Api Calling
  postAddToCartData(context, dataName, customImage, sku) async {
    var passedAddTocart = {
      "cartItem": {"sku": "$sku", "qty": 1, "quote_id": "367"}
    };
    var addTocartData = await RecommendedProductsAPIRepository()
        .postAddTOCartProductResponse(passedAddTocart);
    print("Add To Cart Data ${addTocartData}");
    if (addTocartData['message'] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(addTocartData['message'])),
      );
    } else {
      return _showDialog(context, dataName, customImage);
    }
  }

  //ShowDialog For Confomation
  void _showDialog(var context, dataname, customimage) {
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
