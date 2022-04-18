import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../data/model/Wishlist/wishlist_model.dart';
import '../../../main.dart';
import '../../../utils/get_network_service/APIRepository/wishlist_api_repository.dart';

class WishlistController extends GetxController {
  RxInt index = 0.obs;
  RxString chosenValue = LanguageConstant.myWishlistText.tr.obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  var wishlistProductList = <ProductModel>[].obs;
  final WishListAPIRepository wishListAPIRepository;
  WishlistController({required this.wishListAPIRepository});
  Rx<WishListProductModel>? wishItemModel = WishListProductModel().obs;

  @override
  void onInit() {
    super.onInit();
    getWishlistProducts();
  }

  getWishlistProducts() async {
    wishItemModel?.value = await wishListAPIRepository.getWishListApiResponse();
  }

  Future<bool> deleteWishlistProduct(String id) async {
    return await deleteWishlistProduct(id);
  }

  Future<bool> postWishlistProduct(String sku) async {
    return await postWishlistProduct(sku);
  }

  var getCartId = 0.obs;
  var getCartToken = "".obs;

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

  deleteWishListData(context, dataName, customImage, sku, getId) async {
    var addTocartData;
    addTocartData =
        await RecommendedProductsAPIRepository().deleteWishList(getId);
    print("Delete ID  To Cart Data ${addTocartData}");
    if (addTocartData['message'] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(addTocartData['message'])),
      );
    } else {
      return showAddDialog(context, dataName, customImage);
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
}
