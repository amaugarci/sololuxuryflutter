import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/splash_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class SplashAPIRepository implements ISplashRepository {
  final SplashAPIProvider splashAPIProvider;

  SplashAPIRepository({required this.splashAPIProvider});

  @override
  Future<String> getSplashAPIResponse() async {
    // TODO: implement getSplashAPIResponse
    Response response = await splashAPIProvider.getSplashAPIResponse(endPoint: AppConstants.jsonEndPoint);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return jsonDecode(response.body!)['countryCode'];
    }
  }


}