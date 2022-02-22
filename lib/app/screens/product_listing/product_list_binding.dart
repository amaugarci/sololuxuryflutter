import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_listing/product_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
