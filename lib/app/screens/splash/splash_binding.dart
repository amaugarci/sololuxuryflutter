import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/splash/splash_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/splash_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/splash_api_repository.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => SplashController(splashAPIRepository: Get.find()));
    Get.lazyPut<SplashAPIProvider>(() => SplashAPIProvider());
    Get.put(SplashAPIRepository(splashAPIProvider: Get.find()));
  }

}