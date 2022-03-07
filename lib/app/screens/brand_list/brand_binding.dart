import 'package:get/get.dart';

import 'brand_controller.dart';

class BrandBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => BrandController());
  }

}