import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import '../../app_constants.dart';

abstract class IContactUsProvider {
  Future<Response<ContactUsResponseModel>> getContactUsResponseProvider({required String urlPath, required String contactusRequestJson});
}


class ContactUsAPIProvider extends GetConnect implements IContactUsProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => ContactUsResponseModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<ContactUsResponseModel>> getContactUsResponseProvider({required String urlPath, required String contactusRequestJson}) {
    return post(urlPath, contactusRequestJson, headers: {"Content-type" : "application/json", "Authorization" : AppConstants.defaultToken});
  }

}