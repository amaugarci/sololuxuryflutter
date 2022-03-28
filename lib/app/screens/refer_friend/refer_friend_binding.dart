import 'package:get/get.dart';

import '../../../utils/get_network_service/APIProviders/refer_friend_api_provider.dart';
import '../../../utils/get_network_service/APIRepository/refer_friend_api_repository.dart';
import 'refer_friend_controller.dart';

class ReferFriendBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferFriendController(referFriendAPIRepository: Get.find()));
    Get.lazyPut<ReferFriendAPIProvider>(() => ReferFriendAPIProvider());
    Get.put(ReferFriendAPIRepository(referFriendAPIProvider: Get.find()));
  }
}
