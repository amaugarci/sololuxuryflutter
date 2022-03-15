import 'dart:convert';

import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../../data/model/Home/menu_model.dart';
import '../APIProviders/home_api_provider.dart';

class HomeAPIRepository implements IHomeRepository {
  final HomeAPIProvider homeAPIProvider;

  HomeAPIRepository({required this.homeAPIProvider});

  @override
  Future<MenuModel> getMenuAPIResponse() async {
    final response = await homeAPIProvider.getMenuResponseProvider(
        endPoint: AppConstants.menuEndPoint);
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

  var isLoading = true;

  @override
  Future<BannerListModel> getBannerListAPIResponse() async {
    final response = await homeAPIProvider.getBannerListAPIResponseProvider(
        endPoint: AppConstants.bannerListEndPoint);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
      isLoading = false;
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
