

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class CountryAPIRepository implements ICountryRepository {
  final CountryAPIProvider countryAPIProvider;

  CountryAPIRepository({required this.countryAPIProvider});

  @override
  Future<String> getStoreWebsitesAPIResponse() async {
    Response response = await countryAPIProvider.getStoreAPIResponse(endPoint: AppConstants.storeWebsitesEndPoint);
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
  Future<String> getStoreViewsAPIResponse() async {
    Response response = await countryAPIProvider.getStoreAPIResponse(endPoint: AppConstants.storeViewsEndPoint);
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
  Future<String> getStoreConfigsAPIResponse() async{
    Response response = await countryAPIProvider.getStoreAPIResponse(endPoint: AppConstants.storeConfigsEndPoint);
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