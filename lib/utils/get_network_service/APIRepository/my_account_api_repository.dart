import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:solo_luxury/data/model/myAccount/my_account_model.dart';
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
  String baseUrl =
      "https://findd.sg/api/v1/listing/categories/featured.json?token=33e7-d8be-b192-b825-3bdb-4c51-7f69-92ba";

  Future<MyAccountDetails?> myAccountsApi() async {
    final response = await http.get(
      Uri.parse(AppConstants.apiEndPointMyAccount),
      headers: {"Authorization": "Bearer 4lpwy9aoo06632v0p3uljiybt0v10d12"},
    );
    if (response.statusCode == 200) {
      print("Categories=======================================");
      print(myAccountDetailsResponseModelFromJson(response.body));
      print(response.body);
      return myAccountDetailsResponseModelFromJson(response.body);
    } else {
      print("${response.body}");
      return null;
    }
  }
}
