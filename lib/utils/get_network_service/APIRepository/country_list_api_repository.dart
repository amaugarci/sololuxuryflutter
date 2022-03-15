import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_list_api_provider.dart';

import '../repository_adapter.dart';

class CountryListAPIRepository implements ICountryListRepository {
  final CountryListAPIProvider countryListAPIProvider;

  CountryListAPIRepository({required this.countryListAPIProvider});

  @override
  Future<String> getCountryListResponse() async {
    Response response = await countryListAPIProvider.getcountryListAPIResponse(
        endPoint: AppConstants.countryList);
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

  @override
  Future<String> postaddAddressApiResponse(String requestJson) async {
    Response estimateResponseModel =
        await countryListAPIProvider.postAddAddressResponse(
            endPoint: AppConstants.addAddress, requestJson: requestJson);
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if (estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return estimateResponseModel.body!;
    }
  }
}
