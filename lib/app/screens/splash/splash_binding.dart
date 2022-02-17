import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => SplashController());
  }

}