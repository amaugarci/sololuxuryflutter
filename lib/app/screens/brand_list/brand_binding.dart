import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/brand_list_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/brand_list_api_repository.dart';

import 'brand_controller.dart';

class BrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrandController(brandListAPIRepository: Get.find()));
    Get.lazyPut<BrandListAPIProvider>(() => BrandListAPIProvider());
    Get.put(BrandListAPIRepository(brandListAPIProvider: Get.find()));
  }
}
