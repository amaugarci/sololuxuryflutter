import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_controller.dart';

class WishlistBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }

}