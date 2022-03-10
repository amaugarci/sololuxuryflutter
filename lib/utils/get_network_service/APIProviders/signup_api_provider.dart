import 'package:get/get.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class ISignupProvider {
  Future<Response<SignUpResponseModel>> getSignupResponseProvider({required String urlPath, required String signupRequestJson});
}


class SignupAPIProvider extends GetConnect implements ISignupProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => SignUpResponseModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<SignUpResponseModel>> getSignupResponseProvider({required String urlPath, required String signupRequestJson}) {
    return post(urlPath, signupRequestJson, headers: {"Content-type" : "application/json", "Authorization" : AppConstants.defaultToken});
  }

}