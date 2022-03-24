import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/donation/charity_controller.dart';

class CharityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityController());
  }
}
