import 'package:solo_luxury/data/model/login_response_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';

abstract class ILoginRepository {
  Future<String> getLoginAPIResponse(String loginRequestJson, String userName, String password);
}

abstract class ISignupRepository {
  Future<SignUpResponseModel> getSignupAPIResponse(String signupRequestJson);
}