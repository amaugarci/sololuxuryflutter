import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/teams_condition/tems_condition_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/tems_condition_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/teams_condition_respository.dart';

class TermAndConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        TermAndConditionController(termAndConditionAPIRepository: Get.find()));
    Get.lazyPut<TermAndConditionAPIProvider>(
        () => TermAndConditionAPIProvider());
    Get.put(
        TermAndConditionAPIRepository(termAndConditionAPIProvider: Get.find()));
  }
}
