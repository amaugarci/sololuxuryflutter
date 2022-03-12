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
  Future<MyAccountDetails?> myAccountsApi() async {
    final response = await http.get(
      Uri.parse(AppConstants.apiEndPointMyAccount),
      headers: {"Authorization": "Bearer uci7ew9pxt2h45nlsv50zknlv26q3qir"},
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
