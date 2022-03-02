import 'package:solo_luxury/data/model/login_response_model.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> getLoginAPIResponse(String loginRequestJson);
}