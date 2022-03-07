import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';

import '../../../utils/get_network_service/APIProviders/home_api_provider.dart';
import '../../../utils/get_network_service/APIRepository/home_api_repository.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(homeAPIRepository: Get.find()));
    Get.lazyPut<HomeAPIProvider>(() => HomeAPIProvider());
    Get.put(HomeAPIRepository(homeAPIProvider: Get.find()));
  }

}