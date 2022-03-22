import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/brand_list_api_provider.dart';

import '../repository_adapter.dart';

class BrandListAPIRepository implements IBrandListRepository {
  final BrandListAPIProvider brandListAPIProvider;

  BrandListAPIRepository({required this.brandListAPIProvider});

  @override
  Future<String> getBrandListResponse() async {
    Response response = await brandListAPIProvider.getBrandListAPIResponse(
        endPoint: AppConstants.brandListApi);
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
