import 'package:get/get.dart';
import 'package:solo_luxury/data/model/login_response_model.dart';

abstract class ILoginProvider {
  Future<Response<LoginResponseModel>> getLoginResponseProvider({required String urlPath, required String loginRequestJson});
}

class LoginProvider extends GetConnect implements ILoginProvider {

  @override
  void onInit() {

    httpClient.defaultDecoder = (val) => LoginResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = "$baseUrl";
  }


  @override
  Future<Response<LoginResponseModel>> getLoginResponseProvider({required String urlPath, required String loginRequestJson}) {
    // TODO: implement getLoginResponseProvider

    return post(urlPath, loginRequestJson, headers: {"Content-type" : "application/json"});

  }

}