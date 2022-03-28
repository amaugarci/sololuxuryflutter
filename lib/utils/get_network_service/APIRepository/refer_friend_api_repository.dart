import 'dart:convert';

import 'package:get/get.dart';

import '../../app_constants.dart';
import '../APIProviders/refer_friend_api_provider.dart';
import '../repository_adapter.dart';

class ReferFriendAPIRepository implements IReferFriendRepository {
  final ReferFriendAPIProvider referFriendAPIProvider;

  ReferFriendAPIRepository({required this.referFriendAPIProvider});

  @override
  Future<String> getReferFriendAPIResponse(
      {String? refFirstName,
      String? refEmail,
      String? refPhone,
      String? yourFirstName,
      String? yourEmail,
      String? yourPhone}) async {
    // TODO: implement getReferFriendAPIResponse
    String endPoints =
        "${AppConstants.referFriendEndPoint}?referForm[referrer_first_name]=$refFirstName&referForm[referrer_email]=$refEmail&referForm[referrer_phone]=$refPhone&referForm[your_first_name]=$yourFirstName&referForm[your_email]=$yourEmail&referForm[your_phone]=$yourPhone";
    print("Endpoint -> $endPoints");
    Response response =
        await referFriendAPIProvider.getReferFriendAPIResponse(endPoint: endPoints);
    if (response != null) {
      print(AppConstants.apiEndPointLogin + endPoints);
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return jsonDecode(response.body!)['message'];
    }
  }
}
