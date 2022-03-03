import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/profile/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
