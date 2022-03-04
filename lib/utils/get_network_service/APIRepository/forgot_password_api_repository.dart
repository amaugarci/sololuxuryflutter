import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/forgotpassword_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class ForgotPasswordAPIRepository implements IForgotpasswordRepository {

  final IForgotpasswordProvider provider;

  ForgotPasswordAPIRepository({required this.provider});


  @override
  Future<String> getForgotpasswordAPIResponse(String ForgotpasswordRequestJson,
      String emailAddress) async {
    final forgotpasswordResponseModel = await provider
        .getForgotpasswordResponseProvider(urlPath: AppConstants.forgotpassword,
      emailaddress: "",);

    if (forgotpasswordResponseModel.status.hasError) {
      return Future.error(forgotpasswordResponseModel.statusText!);
    } else {
      return forgotpasswordResponseModel.body!;
    }
  }
}