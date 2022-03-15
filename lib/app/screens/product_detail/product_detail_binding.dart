import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/recommended_products_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController());

    Get.lazyPut<RecommendedProductsAPIProvider>(
        () => RecommendedProductsAPIProvider());
   /* Get.put(() => RecommendedProductsAPIRepository(
        recommendedProductsAPIProvider: Get.find()));*/
    /*  Get.put(() =>
        ProductDetailController(recommendedProductsAPIRepository: Get.find()));*/
  }
}
