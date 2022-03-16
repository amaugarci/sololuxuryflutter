import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/search/search_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/dashboard_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/home_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/dashboard_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/home_api_repository.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(dashboardAPIRepository: Get.find()));
    Get.lazyPut<DashboardAPIProvider>(() => DashboardAPIProvider());
    Get.put(DashboardAPIRepository(dashboardAPIProvider: Get.find()));
  }
}
