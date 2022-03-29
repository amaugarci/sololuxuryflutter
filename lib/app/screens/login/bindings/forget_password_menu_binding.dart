import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/login/controller/forget_password_menu_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/forget_password_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/forget_password_menu_api_repository.dart';

class ForgotPasswordMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordMenuController(forgetPasswordAPIRepository: Get.find()));
    Get.lazyPut<ForgetPasswordAPIProvider>(() => ForgetPasswordAPIProvider());
    Get.put(
        ForgetPasswordMenuAPIRepository(forgetPasswordProvider: Get.find()));
  }
}
