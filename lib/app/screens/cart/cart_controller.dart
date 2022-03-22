import 'package:get/get.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/cart_get_data_repository.dart';

import '../../../data/model/Product/product_model.dart';

class CartController extends GetxController {

  var cartProducts = <ProductModel>[].obs;
  RxObjectMixin? cartModel = CartModel().obs;
  final CartGetDataAPIRepository cartGetDataAPIRepository;

  CartController({required this.cartGetDataAPIRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFaqContent();
    print("CONTROLLER=========");
  }

  void getFaqContent() async {
    print("CONTROLLER=========");
    cartModel?.value =
        await cartGetDataAPIRepository.getCartGetDataApiResponse();
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
