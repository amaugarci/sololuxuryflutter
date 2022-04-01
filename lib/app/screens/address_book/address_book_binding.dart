import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/address_list_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/address_list_api_repository.dart';

import 'address_book_controller.dart';

class AddressBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => AddressBookController(addressListAPIRepository: Get.find()));

    Get.lazyPut<AddressListAPIProvider>(() => AddressListAPIProvider());
    Get.put(AddressListAPIRepository(addressListAPIProvider: Get.find()));
  }
}
