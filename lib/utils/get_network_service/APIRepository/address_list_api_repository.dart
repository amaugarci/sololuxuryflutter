import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/address_list_api_provider.dart';

import '../repository_adapter.dart';

class AddressListAPIRepository implements IAddressListRepository {
  final AddressListAPIProvider addressListAPIProvider;

  AddressListAPIRepository({required this.addressListAPIProvider});

  @override
  Future<String> getAddressListResponse() async {
    Response response = await addressListAPIProvider.getAddressListAPIResponse(
        endPoint: AppConstants.addressList);

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
