import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/faq/faq_controller.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
