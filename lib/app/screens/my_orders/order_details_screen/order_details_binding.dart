import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/my_orders/order_details_screen/order_details_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/return_reason_api_provider..dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/return_reason_api_repository.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => OrderDetailsController(myOrdersAPIRepository: Get.find()));
    Get.lazyPut<ReturnReasonAPIProvider>(() => ReturnReasonAPIProvider());
    Get.put(ReturnReasonAPIRepository(returnReasonAPIProvider: Get.find()));
  }
}
