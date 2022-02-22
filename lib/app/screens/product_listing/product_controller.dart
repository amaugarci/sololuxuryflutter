import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/requests/product_detail_request.dart';

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

  @override
  void onInit() {
    getHomeProducts(86);
    super.onInit();
  }

  void addToLiked(ProductModel product) {
    int index = likedProducts.indexWhere((element) => element.id == product.id);
    if (index == -1)
      likedProducts.add(product);
    else
      likedProducts.removeAt(index);

    likedProducts.refresh();
  }

  bool isLiked(int id) {
    int index = likedProducts.indexWhere((element) => element.id == id);
    if (index == -1) return false;
    return true;
  }

  Future<List<ProductModel>> getHomeProducts(int idCategory) async {
    List<ProductModel> productList = [];

    Map<String, dynamic> data = await categoryProductsRequest('464');
    if (data['items'] != null) {
      for (int i = 0; i < data['items'].length; i++) {
        Map<String, dynamic> item = data['items'][i];
        int id = item['id'];

        int index = productList.indexWhere((element) => element.id == id);

        int startTime = 0;
        int endTime = 0;

        if (index == -1) {
          productList.add(ProductModel(
              isCountDown: 0,
              name: item['name'],
              description: item['description'],
              amount: double.parse(item['amount']).toInt(),
              image: item['image'],
              images: item['images'],
              startTime: startTime,
              endTime: endTime,
              unit: item['unit'] ?? "",
              rating: item['rating'],
              price: double.parse(item['price']),
              discount: double.parse(item['discount']),
              discountType: 0,
              hasCoupon: false,
              reviewCount: item['reviewCount'],
              id: id));
        }
      }
      homeCategoryProductList.value = productList;
      homeCategoryProductList.refresh();
    }

    return productList;
  }

  Future<ProductModel> getProductDetail(String itemSku) async {
    ProductModel product = ProductModel();

    Map<String, dynamic> data = await getProductDetailRequest(itemSku);

    int id = data['id'];
    String sku = data['sku'];
    String name = data['name'];
    int attribute_set_id = data['attribute_set_id'];
    int price = data['price'];
    int status = data['status'];
    int visibility = data['visibility'];
    String type_id = data['type_id'];
    int weight = data['weight'];

    for (int i = 0; i < data['media_gallery_entries'].length; i++) {
      Map<String, dynamic> mediaItems = data['media_gallery_entries'][i];

    }




    return product;
  }
}
