import 'dart:convert';

import 'package:get/get.dart';

import '../../app_constants.dart';

abstract class IReferFriendProvider {
  Future<dynamic> getReferFriendAPIResponse({required String endPoint});
}

class ReferFriendAPIProvider extends GetConnect implements IReferFriendProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<dynamic> getReferFriendAPIResponse({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint, "", headers: {"Content-type": "application/json", "Authorization": AppConstants.adminToken});
  }
}
