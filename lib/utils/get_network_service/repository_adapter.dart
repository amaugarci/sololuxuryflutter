import 'package:solo_luxury/data/model/login_response_model.dart';

import '../../data/model/InfluenceRegistration/influencer_registration_model.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> getLoginAPIResponse(String loginRequestJson);
}

///influencer class
abstract class IInfluencerRepository {
  Future<InfluencerRegistrationMethodModel> getInfluencerAPIResponse(
      String influencerRequestJson);
}
