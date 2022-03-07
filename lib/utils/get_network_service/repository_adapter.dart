import 'package:solo_luxury/data/model/signup_response_model.dart';

import '../../data/model/InfluenceRegistration/influencer_registration_model.dart';

abstract class ILoginRepository {

  Future<String> getLoginAPIResponse(String loginRequestJson, String userName, String password);
}

abstract class ISignupRepository {
  Future<SignUpResponseModel> getSignupAPIResponse(String signupRequestJson);
}


///influencer class
abstract class IInfluencerRepository {
  Future<InfluencerRegistrationMethodModel> getInfluencerAPIResponse(
      String influencerRequestJson);
}
