import 'package:solo_luxury/data/model/brand_list/BrandData.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/brand_list_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';

class BrandListAPIRepository implements IBrandListRepository {

  final BrandListProvider brandListProvider;

  BrandListAPIRepository({required this.brandListProvider});


  @override
  Future<BrandData> getBrandDataApiResponse() async{
    final response = await brandListProvider.getBrandListResponseProvider(endPoint: AppConstants.brandList);
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
