import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solo_luxury/app/screens/login/controller/forgot_password_page_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/forgotpassword_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/forgot_password_api_repository.dart';

class ForgotPasswordPageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<IForgotpasswordProvider>(() => ForgotPasswordProvider());
    Get.put(ForgotPasswordAPIRepository(provider: Get.find()));
    Get.lazyPut(() => ForgotPasswordPageController( forgotpasswordAPIRepository: Get.find()));
  }

}