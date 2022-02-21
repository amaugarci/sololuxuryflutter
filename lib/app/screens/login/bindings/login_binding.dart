import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/login/controller/login_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/login_api_repository.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ILoginProvider>(() => LoginProvider());
    Get.put(LoginAPIRepository(provider: Get.find()));
    Get.lazyPut(() => LoginController(loginAPIRepository: Get.find()));
  }

}