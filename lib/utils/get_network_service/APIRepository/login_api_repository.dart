import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class LoginAPIRepository implements ILoginRepository {

  final ILoginProvider provider;

  LoginAPIRepository({required this.provider});

  @override
  Future<String> getLoginAPIResponse(String loginRequestJson, String userName, String password) async {
    final loginResponseModel = await provider.getLoginResponseProvider(urlPath: AppConstants.login, userName: userName, password: password, loginRequestJson: loginRequestJson);

    if(loginResponseModel.status.hasError) {
      print("error -> ");
      print(loginResponseModel.statusText!);
      return Future.error(loginResponseModel.statusText!);
    } else {
      print("success -> ");
      return loginResponseModel.body!;
    }
  }

}