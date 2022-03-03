import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/login/controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => ForgotPasswordController());
  }

}