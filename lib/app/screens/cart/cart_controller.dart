import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/cart_get_data_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';

import '../../../data/model/Product/product_model.dart';

class CartController extends GetxController {
  var cartProducts = <ProductModel>[].obs;
  RxObjectMixin? cartModel = CartModel().obs;
  final CartGetDataAPIRepository cartGetDataAPIRepository;
  var cartItemNumber = 0.obs;
  var cartItemPrice = 0.obs;

  CartController({required this.cartGetDataAPIRepository});

  var isLoading = true.obs;

  @override
  void onInit() {
    getFaqContent();
    super.onInit();

    print("CONTROLLER=========");
  }

  void getFaqContent() async {
    isLoading.value = true;
    var cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse();
    cartModel?.value = CartModel.fromJson(json.decode(cartData));
    print("CartModel Is $cartModel");
    cartItemPrice.value = cartModel!.value.items[0].price;
    cartItemNumber.value = cartModel!.value.items[0].qty;
    // print( "\$${cartModel!.value.items[0].qty}");
    isLoading.value = false;
  }

  void deleteCartProductContent(deleteProductId) async {
    var deleteProduct = await cartGetDataAPIRepository
        .deleteCartCartQTYDataApiResponse(deleteProductId);
    print("DeleteProduct IS  Is $deleteProduct");
    cartItemNumber.value = 0;
    cartItemPrice.value = 0;
    getFaqContent();
  }

  //Add TO Cart Api Calling
  postAddToCartData(context, dataName, sku) async {
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
      cartItemNumber.value = addTocartData["qty"];
      cartItemPrice.value = addTocartData["price"] * addTocartData["qty"];
      return print("${addTocartData["qty"]}");
    }
  }

  postRemoveFromCartData(context, dataName, sku) async {
    var passedAddTocart = {
      "cartItem": {"sku": "$sku", "qty": -1, "quote_id": "367"}
    };
    var addTocartData = await RecommendedProductsAPIRepository()
        .postAddTOCartProductResponse(passedAddTocart);
    print("Add To Cart Data ${addTocartData}");
    if (addTocartData['message'] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(addTocartData['message'])),
      );
    } else {
      cartItemNumber.value = addTocartData["qty"];
      cartItemPrice.value = addTocartData["price"] * addTocartData["qty"];
      return print("${addTocartData["qty"]}");
    }
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
