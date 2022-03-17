import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/faq_api_provider.dart';

import '../../../utils/get_network_service/APIRepository/faq_api_repository.dart';
import 'faq_controller.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController(faqAPIRepository: Get.find()));
    Get.lazyPut<IFaqProvider>(() => FaqProvider());
    Get.put(FaqAPIRepository(faqProvider: Get.find()));
  }
}
