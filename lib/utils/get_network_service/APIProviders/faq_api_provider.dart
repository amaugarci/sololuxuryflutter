import 'package:get/get.dart';

import '../../../data/model/Faq/faq_model.dart';
import '../../app_constants.dart';

abstract class IFaqProvider {
  Future<Response<FaqModel>> getFaqResponseProvider({required String endPoint});
}

class FaqProvider extends GetConnect implements IFaqProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => FaqModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<FaqModel>> getFaqResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.adminToken
    });
  }
}
