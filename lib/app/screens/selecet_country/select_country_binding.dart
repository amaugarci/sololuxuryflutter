import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/select_contry_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_list_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/select_country_api_repositry.dart';

import 'select_country_controller.dart';

class SelectCountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => SelectCountryController(selectCountrytAPIRepository: Get.find()));
    Get.lazyPut<SelectCountryAPIProvider>(() => SelectCountryAPIProvider());
    Get.put(SelectCountryAPIRepository(selectCountryAPIProvider: Get.find()));
  }
}
