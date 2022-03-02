import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}