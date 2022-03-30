import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/order_confirmation_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/order_confirmation_api_repository.dart';

class OrderConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderConfirmationController(
        orderConfirmationApiRepository: Get.find()));
    Get.lazyPut<OrdersConfirmationProvider>(() => OrdersConfirmationProvider());
    Get.put(
        OrderConfirmationApiRepository(ordersConfirmationProvider: Get.find()));
  }
}
