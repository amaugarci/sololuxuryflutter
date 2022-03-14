import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_controller.dart';

class ReturnsAndRefundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnsAndRefundsController());
  }
}
