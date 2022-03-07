import 'package:solo_luxury/data/model/InfluenceRegistration/influencer_registration_model.dart';

import '../../app_constants.dart';
import '../APIProviders/influencer_api_provider.dart';
import '../repository_adapter.dart';

class InfluencerApiRepository implements IInfluencerRepository {
  final InfluencerAPIProvider influencerAPIProvider;

  InfluencerApiRepository({required this.influencerAPIProvider});

  @override
  Future<InfluencerRegistrationMethodModel> getInfluencerAPIResponse(
      dynamic influencerRequestJson) async {
    final influencerResponseModel =
        await influencerAPIProvider.getInfluencerRegProvider(
            urlPath: AppConstants.apiEndPointNewInfluencer,
            influencerRequestJson: influencerRequestJson);
    if (influencerResponseModel.status.hasError) {
      return Future.error(influencerResponseModel.statusText!);
    } else {
      return influencerResponseModel.body!;
    }
  }
}
