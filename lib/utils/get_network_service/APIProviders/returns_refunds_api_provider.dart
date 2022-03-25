import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IReturnsRefundsProvider {
  Future<Response> getReturnsRefundsProvider({required String endPoint});
}

class ReturnsRefundsProvider extends GetConnect
    implements IReturnsRefundsProvider {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (val) => FaqModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response> getReturnsRefundsProvider({required String endPoint}) {
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.adminToken
    });
    // TODO: implement getReturnsRefundsProvider
    throw UnimplementedError();
  }
}
