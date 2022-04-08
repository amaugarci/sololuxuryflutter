import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/brand_list_api_provider.dart';

import '../../validator.dart';
import '../repository_adapter.dart';

class BrandListAPIRepository implements IBrandListRepository {
  final BrandListAPIProvider brandListAPIProvider;

  BrandListAPIRepository({required this.brandListAPIProvider});

  @override
  Future<dynamic> getBrandListResponse() async {
    Response response = await brandListAPIProvider.getBrandListAPIResponse(
        endPoint: AppConstants.brandList);

    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: response.body!, message: response.statusText);
      return null;
    } else {
      print("success -> ");
      return response.body!;
    }
  }
}
