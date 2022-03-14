import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/contact_us_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class ContactUsAPIRepository implements IContactUsRepository {

  final ContactUsAPIProvider contactUsAPIProvider;

  ContactUsAPIRepository({required this.contactUsAPIProvider});

  @override
  Future<ContactUsResponseModel> getContactUsApiResponse(String contactusRequestJson) async {
    final contactUsResponseModel = await contactUsAPIProvider.getContactUsResponseProvider(urlPath: AppConstants.signUp,  contactusRequestJson:contactusRequestJson);

    if(contactUsResponseModel.status.hasError) {
      return Future.error(contactUsResponseModel.statusText!);
    } else {
      return contactUsResponseModel.body!;
    }
  }

}