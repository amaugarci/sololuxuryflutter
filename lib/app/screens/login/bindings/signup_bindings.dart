import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/login/controller/signup_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/signup_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/signup_api_repository.dart';

class SignupBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => SignupAPIProvider());
    Get.put(SignupAPIRepository(signupAPIProvider: Get.find()));
    Get.lazyPut(() => SignupController(signupAPIRepository: Get.find()));
  }

}