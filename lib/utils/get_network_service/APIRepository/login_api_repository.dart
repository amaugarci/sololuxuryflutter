import 'package:solo_luxury/data/model/login_response_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class LoginAPIRepository implements ILoginRepository {

  final ILoginProvider provider;

  LoginAPIRepository({required this.provider});

  @override
  Future<LoginResponseModel> getLoginAPIResponse(String loginRequestJson) async {
    // TODO: implement getLoginAPIResponse

    final loginResponseModel = await provider.getLoginResponseProvider(urlPath: "", loginRequestJson: loginRequestJson);

    if(loginResponseModel.status.hasError) {
      return Future.error(loginResponseModel.statusText!);
    } else {
      return loginResponseModel.body!;
    }
  }

}