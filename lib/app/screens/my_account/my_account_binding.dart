import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/my_account_api_provider.dart';

import 'my_account_controller.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    /*   Get.lazyPut(() => MyAccountController(myAccountAPIRepository: Get.find()));*/
    Get.lazyPut(() => MyAccountController());
    Get.lazyPut<IMyAccountProvider>(() => MyAccountAPIProvider());
    /* Get.put(MyAccountAPIRepository(myAccountAPIProvider: Get.find()));*/
  }
}
