import 'package:solo_luxury/utils/get_network_service/APIProviders/faq_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';

class FaqAPIRepository implements IFaqRepository {

  final FaqProvider faqProvider;

  FaqAPIRepository({required this.faqProvider});


  @override
  Future<String> getFaqApiResponse() async{
    final response = await faqProvider.getFaqResponseProvider(endPoint: AppConstants.faq);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if(response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

}