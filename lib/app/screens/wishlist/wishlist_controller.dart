import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../utils/get_network_service/APIRepository/wishlist_api_repository.dart';

class WishlistController extends GetxController {
  RxInt index = 0.obs;
  RxString chosenValue = LanguageConstant.myWishlistText.tr.obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  var wishlistProductList = <ProductModel>[].obs;
  final WishListAPIRepository wishListAPIRepository;
  WishlistController({required this.wishListAPIRepository});
  Rx<ProductModel>? productModel = ProductModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

 getWishlistProducts() async {
    productModel?.value = await wishListAPIRepository.getWishListApiResponse();
    return wishlistProductList.value;
  }

  Future<bool> deleteWishlistProduct(String id) async {
    return await deleteWishlistProduct(id);
  }

  Future<bool> postWishlistProduct(String sku) async {
    return await postWishlistProduct(sku);
  }
}
