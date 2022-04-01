import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/privacy_policy/privacy_policy_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/privacy_policy_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/privacy_policy_repository.dart';

class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => PrivacyPolicyController(privacyPolicyAPIRepository: Get.find()));
    Get.lazyPut<PrivacyPolicyAPIProvider>(() => PrivacyPolicyAPIProvider());
    Get.put(PrivacyPolicyAPIRepository(privacyPolicyAPIProvider: Get.find()));
  }
}
