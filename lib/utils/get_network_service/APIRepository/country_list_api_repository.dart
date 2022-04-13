import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_list_api_provider.dart';

import '../../validator.dart';
import '../repository_adapter.dart';

class CountryListAPIRepository implements ICountryListRepository {
  final CountryListAPIProvider countryListAPIProvider;

  CountryListAPIRepository({required this.countryListAPIProvider});

  @override
  Future<dynamic> getCountryListResponse() async {
    Response response = await countryListAPIProvider.getcountryListAPIResponse(
        endPoint: AppConstants.countryList);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      print("success -> ");
      return response.body!;
    }
  }

  @override
  Future<dynamic> postaddAddressApiResponse(String requestJson) async {
    print("Post Data Is ${requestJson}");
    Response estimateResponseModel =
        await countryListAPIProvider.postAddAddressResponse(
            endPoint: AppConstants.addAddress, requestJson: requestJson);
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if (estimateResponseModel.status.hasError) {
      print("error -> ");
      print(estimateResponseModel.statusText!);
      Validators.apiResponseMessage(
          body: estimateResponseModel.body!,
          message: estimateResponseModel.statusText);
      return null;
    } else {
      print("success -> ");
      return estimateResponseModel.body!;
    }
  }
}
