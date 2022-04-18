import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/cart_get_data_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/cart_get_data_repository.dart';

import 'cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    print("BINDING=============");
    Get.lazyPut(() => CartController(cartGetDataAPIRepository: Get.find()));
    print("BINDING=============");
    Get.lazyPut<CartGetDataProvider>(() => CartGetDataProvider());
    print("BINDING=============");
    Get.put(CartGetDataAPIRepository(cartGetDataProvider: Get.find()));
  }
}
