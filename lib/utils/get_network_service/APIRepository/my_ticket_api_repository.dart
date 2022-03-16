import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/my_ticket_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class MyTicketAPIRepository implements IMyTicketRepository {
  final MyTicketAPIProvider myTicketAPIProvider;

  MyTicketAPIRepository({required this.myTicketAPIProvider});
  @override
  Future<dynamic> getmyTicketApiResponse(dynamic requestJson) async {
    var response = await myTicketAPIProvider.getmyTicketAPIResponse(
        endPoint: AppConstants.myTicketApi, requestJson: requestJson);
    // if (response != null) {
    //   print("response.statusCode -> ");
    //   print(response.statusCode);
    // }
    // if (response.status.hasError) {
    //   return Future.error(response.statusText!);
    // } else {
    return response;
    // }
  }
}
