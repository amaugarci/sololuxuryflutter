import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/tems_condition_api_provider.dart';

import '../../app_constants.dart';
import '../../validator.dart';
import '../repository_adapter.dart';

class TermAndConditionAPIRepository implements ITermAndConditionRepository {
  final TermAndConditionAPIProvider termAndConditionAPIProvider;

  TermAndConditionAPIRepository({required this.termAndConditionAPIProvider});

  @override
  Future<dynamic> getTermAndConditionResponse() async {
    Response response =
        await termAndConditionAPIProvider.getTermAndConditionAPIResponse(
            endPoint: AppConstants.termAndConditionApi);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
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
