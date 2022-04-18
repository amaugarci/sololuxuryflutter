import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/forget_password_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class ForgetPasswordMenuAPIRepository implements IForgetPasswordRepository {
  final ForgetPasswordAPIProvider forgetPasswordProvider;

  ForgetPasswordMenuAPIRepository({required this.forgetPasswordProvider});

  @override
  Future<String> putForgetPasswordApiResponse(
      {var forgetPasswordRequestJson}) async {
    final response = await forgetPasswordProvider.getForgetPasswordProvider(
        urlPath: AppConstants.getUrlWithCode(AppConstants.forgetPassword),
        forgetPasswordRequestJson: forgetPasswordRequestJson);

    if (response.status.hasError) {
      print("errorFORGETPASSWORD -> ");
      print(response.statusText!);
      return Future.error(response.statusText!);
    } else {
      print("successFORGETPASSWORD -> ");
      return response.body!;
    }

    // TODO: implement putForgetPasswordApiResponse
    throw UnimplementedError();
  }

/* @override
  Future<String> getLoginAPIResponse(String loginRequestJson, String userName, String password) async {
    final loginResponseModel = await provider.getLoginResponseProvider(urlPath: AppConstants.login, userName: userName, password: password, loginRequestJson: loginRequestJson);

    if(loginResponseModel.status.hasError) {
      print("error -> ");
      print(loginResponseModel.statusText!);
      return Future.error(loginResponseModel.statusText!);
    } else {
      print("success -> ");
      return loginResponseModel.body!;
    }*/
}
