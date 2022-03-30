import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/order_confirmation_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

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
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getOrderConfirmationApiResponse
    throw UnimplementedError();
  }
}
