
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/dashboard/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
