import 'package:get/get.dart';

import '../../../data/model/Product/product_model.dart';



class CartController extends GetxController {
  var cartProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  // int getProductCountById(int id) {
  //   int index = cartProducts.indexWhere((element) => element.id == id);
  //   if (index > -1) {
  //     if (cartProducts[index].count! == 0) {
  //       cartProducts.removeAt(index);
  //       cartProducts.refresh();
  //       return 0;
  //     }
  //     return cartProducts[index].count!;
  //   }
  //   return 0;
  // }
  //
  // double calculateAmount() {
  //   double sum = 0;
  //
  //   for (ProductModel product in cartProducts) {
  //     sum += product.count! * (product.price!);
  //   }
  //
  //   return sum;
  // }




}