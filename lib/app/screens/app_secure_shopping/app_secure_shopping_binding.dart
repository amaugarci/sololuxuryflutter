import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/app_secure_shopping/app_secure_shopping_controller.dart';

class AppSecureShoppingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppSecureShoppingController());
  }
}
