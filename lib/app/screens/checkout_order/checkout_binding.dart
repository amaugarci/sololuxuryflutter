import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_order_controller.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/check_order_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/check_order_api_repository.dart';

import '../../../utils/get_network_service/APIProviders/login_api_provider.dart';

class CheckoutOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICheckOutOrderProvider>(() => CheckOutOrderProvider());
    Get.put(CheckoutOrderAPIRepository(provider: Get.find()));
    Get.lazyPut(() => CheckoutOrderController(checkoutOrderAPIRepository: Get.find()));
  }
}
