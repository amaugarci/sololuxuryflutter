import 'package:get/get.dart';

import 'package:solo_luxury/app/screens/influencer_registraction/influencer_registration_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/influencer_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/influencer_api_repository.dart';

class InfluencerRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerAPIProvider());
    Get.put(InfluencerApiRepository(influencerAPIProvider: Get.find()));
    Get.lazyPut(() =>
        InfluencerRegistrationController(influencerApiRepository: Get.find()));
  }
}
