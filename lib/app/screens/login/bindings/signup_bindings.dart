import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/login/controller/signup_controller.dart';

class SignupBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => SignupController());
  }

}