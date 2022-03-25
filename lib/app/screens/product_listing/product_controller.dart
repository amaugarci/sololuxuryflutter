import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/product_list_api_repository.dart';
import '../../../data/model/Product/product_model.dart';
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

  @override
  void onInit() {
    getHomeProducts(Get.arguments[0].toString());
    print("Id -> ${Get.arguments[0]}");
    print("Name -> ${Get.arguments[1]}");
    ProductDetailsBindings().dependencies();
    super.onInit();
  }

  getHomeProducts(String val) async {

    productModel?.value =
        await productListAPIRepository.getProductListApiResponse(val);

  }
}
