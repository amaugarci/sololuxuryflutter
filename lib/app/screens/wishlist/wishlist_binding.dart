import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/wishlist_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/wishlist_api_repository.dart';

class WishlistBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController(wishListAPIRepository: Get.find()));
    Get.lazyPut<IWishListProvider>(() => WishListAPIProvider());
    Get.put(WishListAPIRepository(wishListProvider: Get.find()));
  }

}