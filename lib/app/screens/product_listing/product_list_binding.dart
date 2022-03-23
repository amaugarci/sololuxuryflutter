import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_controller.dart';
import 'package:solo_luxury/app/screens/product_listing/product_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/product_list_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/product_list_api_repository.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(productListAPIRepository: Get.find()));
    Get.lazyPut<IProductListProvider>(() => ProductListProvider());
    Get.put(ProductListAPIRepository(productListProvider: Get.find()));
    Get.lazyPut(()=>ProductDetailController());
  }
}
