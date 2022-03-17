import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_list_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_list_api_repository.dart';

import 'add_address_controller.dart';

class AddAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => AddAddressController(countryListAPIRepository: Get.find()));
    Get.lazyPut<CountryListAPIProvider>(() => CountryListAPIProvider());
    Get.put(CountryListAPIRepository(countryListAPIProvider: Get.find()));
  }
}
