import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:solo_luxury/data/model/myAccount/my_account_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';

/*
class MyAccountAPIRepository implements IMyAccountRepository {
  final IMyAccountProvider myAccountAPIProvider;

  MyAccountAPIRepository({required this.myAccountAPIProvider});

  @override
  Future<MyAccountDetails> getMyAccountApiResponse() async {
    final response = await myAccountAPIProvider.getMyAccountProvider(
        endPoint: AppConstants.apiEndPointMyAccount);
    print("ERRoR==================${response.body!.addresses}");

    if (response.status.hasError) {
      print("ERRoR==================${response.body!.addresses}");

      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
*/

class MyAccountAPIRepository extends GetxController {
  Future<MyAccountDetails?> myAccountsApi() async {
    print(
        "Categories=======================================Bearer ${localStore.customerToken}");
    print(
        "Categories=======================================Bearer ${AppConstants.apiEndPointLogin + AppConstants.apiEndPointMyAccount}");
    final response = await http.get(
      Uri.parse(
          AppConstants.apiEndPointLogin + AppConstants.apiEndPointMyAccount),
      headers: {"Authorization": "Bearer ${localStore.customerToken}"},
    );
    if (response.statusCode == 200) {
      print(
          "Categories=======================================Bearer ${localStore.customerToken}");
      print(
          "Categories=======================================Bearer ${AppConstants.apiEndPointLogin + AppConstants.apiEndPointMyAccount}");
      print(myAccountDetailsResponseModelFromJson(response.body));
      print(response.body);
      return myAccountDetailsResponseModelFromJson(response.body);
    } else {
      print("${response.body}");
      return null;
    }
  }
}
