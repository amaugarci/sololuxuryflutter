import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_controller.dart';

class OrderConfirmationBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => OrderConfirmationController());
  }

}