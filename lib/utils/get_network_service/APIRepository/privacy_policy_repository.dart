import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/privacy_policy_api_provider.dart';

import '../../app_constants.dart';
import '../repository_adapter.dart';

class PrivacyPolicyAPIRepository implements IPrivacyPolicyRepository {
  final PrivacyPolicyAPIProvider privacyPolicyAPIProvider;

  PrivacyPolicyAPIRepository({required this.privacyPolicyAPIProvider});

  @override
  Future<String> getPrivacyPolicyResponse() async {
    Response response = await privacyPolicyAPIProvider
        .getPrivacyPolicyAPIResponse(endPoint: AppConstants.privacyPolicyApi);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
