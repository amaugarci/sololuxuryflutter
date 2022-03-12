
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/dashboard/dashboard_controller.dart';

import '../../../utils/get_network_service/APIProviders/dashboard_api_provider.dart';
import '../../../utils/get_network_service/APIRepository/dashboard_api_repository.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(dashboardAPIRepository: Get.find()));
    Get.lazyPut<DashboardAPIProvider>(() => DashboardAPIProvider());
    Get.put(DashboardAPIRepository(dashboardAPIProvider: Get.find()));
  }
}
