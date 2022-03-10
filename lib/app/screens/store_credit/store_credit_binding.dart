import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/store_credit/store_credit_controller.dart';

class StoreCreditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreCreditController());
  }
}
