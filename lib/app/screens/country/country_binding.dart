import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';

class CountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController(countryAPIRepository: Get.find()));
    Get.lazyPut<CountryAPIProvider>(() => CountryAPIProvider());
    Get.put(CountryAPIRepository(countryAPIProvider: Get.find()));
  }
}
