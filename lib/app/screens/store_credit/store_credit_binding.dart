import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/store_credit/store_credit_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/store_credit_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/store_credit_api_repository.dart';

class StoreCreditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => StoreCreditController(storeCreditAPIRepository: Get.find()));
    Get.lazyPut<StoreCreditAPIProvider>(() => StoreCreditAPIProvider());
    Get.put(StoreCreditAPIRepository(storeCreditAPIProvider: Get.find()));
  }
}
