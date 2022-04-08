import 'dart:convert';

import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/order_confirmation_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../validator.dart';

class OrderConfirmationApiRepository implements IOrderConfirmationRepository {
  final OrdersConfirmationProvider ordersConfirmationProvider;

  OrderConfirmationApiRepository({required this.ordersConfirmationProvider});

  @override
  Future<dynamic> getOrderConfirmationApiResponse({var orderId}) async {
    final response =
        await ordersConfirmationProvider.getOrderConfirmationProvider(
            endPoint: "${AppConstants.orderConfirmation + orderId}");
    if (response != null) {
      print("response.statusCode getMyOrdersApiResponse-> ");
      print(response.statusCode);
      print(response.body);
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
    // TODO: implement getOrderConfirmationApiResponse
    throw UnimplementedError();
  }
}
