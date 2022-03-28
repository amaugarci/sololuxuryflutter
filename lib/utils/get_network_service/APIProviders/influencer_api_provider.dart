import 'package:get/get.dart';
import '../../../data/model/InfluenceRegistration/influencer_registration_model.dart';
import '../../app_constants.dart';
import 'package:http/http.dart' as http;

abstract class IInfluencerAPIProvider {
  Future<Response<InfluencerRegistrationMethodModel>> getInfluencerRegProvider(
      {required String urlPath, required String influencerRequestJson});
}

class InfluencerAPIProvider extends GetConnect
    implements IInfluencerAPIProvider {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.defaultDecoder =
        (val) => InfluencerRegistrationMethodModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointNewInfluencer;
  }

  @override
  Future<Response<InfluencerRegistrationMethodModel>> getInfluencerRegProvider(
      {required String urlPath, required dynamic influencerRequestJson}) async {
    // final header = await NetworkDioHttp.getTestHeadersInfluencer();

    var response = await http.post(
        Uri.parse("https://erp.theluxuryunlimited.com/api/influencer/add"),
        body: influencerRequestJson,
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
