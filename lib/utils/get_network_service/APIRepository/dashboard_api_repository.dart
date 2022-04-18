import 'dart:convert';

import 'package:solo_luxury/data/model/Home/banner_list_model.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../app_constants.dart';
import '../../validator.dart';
import '../APIProviders/dashboard_api_provider.dart';
import '../repository_adapter.dart';

class DashboardAPIRepository implements IDashboardRepository {

  final DashboardAPIProvider dashboardAPIProvider;

  DashboardAPIRepository({required this.dashboardAPIProvider});

  @override
  Future<dynamic> getMenuAPIResponse() async {
    final response = await dashboardAPIProvider.getMenuResponseProvider(endPoint: AppConstants.getUrlWithCode(AppConstants.menuEndPoint));
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if(response.status.hasError) {
      Validators.apiResponseMessage(body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      return response.body!;
    }
  }

}
