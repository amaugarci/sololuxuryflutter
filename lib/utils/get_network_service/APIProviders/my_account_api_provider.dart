import 'package:get/get.dart';
import 'package:solo_luxury/data/model/myAccount/my_account_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IMyAccountProvider {
  Future<Response<MyAccountDetails>> getMyAccountProvider(
      {required String endPoint});
}

class MyAccountAPIProvider extends GetConnect implements IMyAccountProvider {
  @override
  void onInit() {}

  @override
  Future<Response<MyAccountDetails>> getMyAccountProvider(
      {required String endPoint}) async {
    httpClient.defaultDecoder = (val) => MyAccountDetails.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointMyAccount;
    print("url -> $endPoint");

    return get(
      endPoint,
      headers: {"Authorization": "Bearer fp7ad24iduu4isr8zo67r8azaopvp60c"},
    );

    // TODO: implement getMyAccountProvider
    throw UnimplementedError();
  }
}
