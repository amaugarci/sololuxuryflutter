import 'package:get/get.dart';
import 'package:solo_luxury/data/model/MyOders/MyOrdersData.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import '../../../data/model/Home/menu_model.dart';

abstract class IMyOderProvider {
  Future<Response<MyOrdersData>> getMyOrderResponseProvider(
      {required String urlPath});
}

class MyOrderAPIProvider extends GetConnect implements IMyOderProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew;
  }

  @override
  Future<Response<MyOrdersData>> getMyOrderResponseProvider(
      {required String urlPath}) async {
    // final header = await NetworkDioHttp.getTestHeadersInfluencer();

    var response = await http.post(
        Uri.parse(
            "https://dev3.sololuxury.com/rest/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=devdyna@gmail.com"),
        //   body: influencerRequestJson,
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer pdrqv7sasg7z54851cieiycp8df4pvs8'
        });

    print("RESPONSE :::::::::::::::::$response");
    print("RESPONSE :::::::::::::::::${response.body}");
    print("RESPONSE :::::::::::::::::${response.statusCode}");

    /* return post(urlPath, influencerRequestJson, headers: {
      'Content-type': 'application/json',
      'Authorization': 'Bearer pdrqv7sasg7z54851cieiycp8df4pvs8',
    });*/
    throw UnimplementedError();
  }
}
