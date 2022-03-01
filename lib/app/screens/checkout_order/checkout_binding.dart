import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_order_controller.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';

class CheckoutOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutOrderController());
  }
}
