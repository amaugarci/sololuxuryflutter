import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/return_reason_api_provider..dart';

import '../repository_adapter.dart';

class ReturnReasonAPIRepository implements IReturnReasonRepository {
  final ReturnReasonAPIProvider returnReasonAPIProvider;

  ReturnReasonAPIRepository({required this.returnReasonAPIProvider});

  @override
  Future<String> getReturnReasonResponse() async {
    Response response = await returnReasonAPIProvider
        .getReturnReasonAPIResponse(endPoint: AppConstants.returnReasonApi);

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
