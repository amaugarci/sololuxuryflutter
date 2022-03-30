import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/cart_get_data_api_provider.dart';

import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';

class CartGetDataAPIRepository implements ICartRepository {
  final CartGetDataProvider cartGetDataProvider;

  CartGetDataAPIRepository({required this.cartGetDataProvider});

  @override
  Future<String> getCartGetDataApiResponse() async {
    final response = await cartGetDataProvider.getCartGetDataResponseProvider(
        endPoint: AppConstants.cartGetData);
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

  @override
  Future<dynamic> deleteCartCartQTYDataApiResponse(itemId) async {
    final response =
        await cartGetDataProvider.deleteCartQtyDataResponseProvider(
            endPoint: AppConstants.deleteCartProdyctData + itemId);
    if (response != null) {
      print("Response Is $response");
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
