import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/select_contry_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class SelectCountryAPIRepository implements ISelectCountryRepository {
  final SelectCountryAPIProvider selectCountryAPIProvider;

  SelectCountryAPIRepository({required this.selectCountryAPIProvider});

  @override
  Future<String> getSelectCountryResponse() async {
    Response response = await selectCountryAPIProvider
        .getselectCountryAPIResponse(endPoint: AppConstants.countryList);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
