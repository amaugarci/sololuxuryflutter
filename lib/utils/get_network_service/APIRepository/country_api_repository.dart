

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../validator.dart';

class CountryAPIRepository implements ICountryRepository {
  final CountryAPIProvider countryAPIProvider;

  CountryAPIRepository({required this.countryAPIProvider});

  @override
  Future<dynamic> getStoreWebsitesAPIResponse() async {
    Response response = await countryAPIProvider.getStoreAPIResponse(endPoint: AppConstants.storeWebsitesEndPoint);
    if (response != null) {
      print("getStoreWebsitesAPIResponse -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      Validators.apiResponseMessage(body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      return response.body!;
    }
  }

  @override
  Future<dynamic> getStoreViewsAPIResponse() async {
    Response response = await countryAPIProvider.getStoreAPIResponse(endPoint: AppConstants.storeViewsEndPoint);
    if (response != null) {
      print("getStoreViewsAPIResponse -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      Validators.apiResponseMessage(body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      return response.body!;
    }
  }


  @override
  Future<dynamic> getStoreConfigsAPIResponse() async{
    Response response = await countryAPIProvider.getStoreAPIResponse(endPoint: AppConstants.storeConfigsEndPoint);
    if (response != null) {
      print("getStoreConfigsAPIResponse -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      Validators.apiResponseMessage(body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      return response.body!;
    }
  }
}