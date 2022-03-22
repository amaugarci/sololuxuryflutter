import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/product_list_api_repository.dart';
import '../../../data/model/Product/product_model.dart';
import '../../../data/requests/category_product_request.dart';
import '../cart/cart_controller.dart';

class ProductController extends GetxController {
  var likedProducts = <ProductModel>[].obs;
  var selectedIndex = 0.obs;
  var activeProduct = ProductModel().obs;
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  final CartController cartController = Get.put(CartController());
  var homeCategoryProductList = <ProductModel>[].obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<ProductModel>? productModel = ProductModel().obs;
  final ProductListAPIRepository productListAPIRepository;
  ProductController({required this.productListAPIRepository});

  @override
  void onInit() {
    getHomeProducts("86");
    super.onInit();
  }

  // void addToLiked(ProductModel product) {
  //   int index = likedProducts.indexWhere((element) => element.id == product);
  //   if (index == -1)
  //     likedProducts.add(product);
  //   else
  //     likedProducts.removeAt(index);
  //
  //   likedProducts.refresh();
  // }

  // bool isLiked(int id) {
  //   int index = likedProducts.indexWhere((element) => element.id == id);
  //   if (index == -1) return false;
  //   return true;
  // }

  getHomeProducts(String val)  async{
    productModel?.value = await productListAPIRepository.getProductListApiResponse();
    //return homeCategoryProductList.value;
  }

}
