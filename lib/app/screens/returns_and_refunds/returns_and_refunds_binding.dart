import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/returns_refunds_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/returns_refunds_api_repository.dart';

class ReturnsAndRefundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnsAndRefundsController(refundAPIRepository: Get.find()));
    Get.lazyPut<ReturnsRefundsProvider>(() => ReturnsRefundsProvider());
    Get.put(ReturnsRefundAPIRepository(returnsRefundsProvider:  Get.find()));
  }
}
