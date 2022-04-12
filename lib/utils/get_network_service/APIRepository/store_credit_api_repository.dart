import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/store_credit_api_provider.dart';

import '../repository_adapter.dart';

class StoreCreditAPIRepository implements IStoreCreditRepository {
  final StoreCreditAPIProvider storeCreditAPIProvider;

  StoreCreditAPIRepository({required this.storeCreditAPIProvider});

  @override
  Future<String> getStoreCreditResponse(id) async {
    Response response = await storeCreditAPIProvider.getStoreCreditAPIResponse(
        endPoint: AppConstants.storeCreditApi + id);
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
