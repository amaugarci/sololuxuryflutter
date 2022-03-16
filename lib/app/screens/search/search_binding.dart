import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/search/search_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/dashboard_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/home_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/search_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/dashboard_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/home_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/search_api_repository.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(searchAPIRepository: Get.find()));
    Get.lazyPut<SearchAPIProvider>(() => SearchAPIProvider());
    Get.put(SearchAPIRepository(searchAPIProvider: Get.find()));
  }
}
