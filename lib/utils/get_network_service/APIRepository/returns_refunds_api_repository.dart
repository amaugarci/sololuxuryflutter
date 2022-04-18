import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/faq_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/returns_refunds_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';

class ReturnsRefundAPIRepository implements IReturnsAndRefundsRepository {
  final ReturnsRefundsProvider returnsRefundsProvider;

  ReturnsRefundAPIRepository({required this.returnsRefundsProvider});

  @override
  Future getReturnsRefundsApiResponse() async {
    final response = await returnsRefundsProvider.getReturnsRefundsProvider(
        endPoint: AppConstants.returnsAndRefund);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getReturnsRefundsApiResponse
    throw UnimplementedError();
  }
}
