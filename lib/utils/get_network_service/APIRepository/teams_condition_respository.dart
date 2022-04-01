import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/tems_condition_api_provider.dart';

import '../../app_constants.dart';
import '../repository_adapter.dart';

class TermAndConditionAPIRepository implements ITermAndConditionRepository {
  final TermAndConditionAPIProvider termAndConditionAPIProvider;

  TermAndConditionAPIRepository({required this.termAndConditionAPIProvider});

  @override
  Future<String> getTermAndConditionResponse() async {
    Response response =
        await termAndConditionAPIProvider.getTermAndConditionAPIResponse(
            endPoint: AppConstants.termAndConditionApi);
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
