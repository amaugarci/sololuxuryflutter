import 'package:get/get.dart';

import '../../../utils/get_network_service/APIProviders/my_orders_api_provider.dart';
import '../../../utils/get_network_service/APIRepository/my_orders_api_repository.dart';
import 'my_orders_controller.dart';

class MyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrdersController(myOrdersAPIRepository: Get.find()));
    Get.lazyPut<MyOrdersListAPIProvider>(() => MyOrdersListAPIProvider());
    Get.put(MyOrdersAPIRepository(myOrderAPIProvider: Get.find()));
  }
}
