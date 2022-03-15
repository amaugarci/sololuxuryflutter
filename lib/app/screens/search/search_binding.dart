import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/search/search_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/home_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/home_api_repository.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(homeAPIRepository: Get.find()));
    Get.lazyPut<HomeAPIProvider>(() => HomeAPIProvider());
    Get.put(HomeAPIRepository(homeAPIProvider: Get.find()));
  }
}
