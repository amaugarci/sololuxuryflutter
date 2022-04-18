import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/address_list_api_provider.dart';

import '../../validator.dart';
import '../repository_adapter.dart';

class AddressListAPIRepository implements IAddressListRepository {
  final AddressListAPIProvider addressListAPIProvider;

  AddressListAPIRepository({required this.addressListAPIProvider});

  @override
  Future<dynamic> getAddressListResponse() async {
    final response = await addressListAPIProvider.getAddressListAPIResponse(
        endPoint: AppConstants.addressList);
    print("Api Response Error ${response.body!}");
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
