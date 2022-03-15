import 'package:solo_luxury/data/model/login_response_model.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> getLoginAPIResponse(String loginRequestJson);
}

abstract class ICountryListRepository {
  Future<String> getCountryListResponse();
  Future<String> postaddAddressApiResponse(String response);
}
