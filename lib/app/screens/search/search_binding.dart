import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
