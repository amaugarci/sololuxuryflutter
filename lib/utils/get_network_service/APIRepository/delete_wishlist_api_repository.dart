import 'package:solo_luxury/utils/get_network_service/APIProviders/delete_wishlist_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';

class DeleteWishListAPIRepository implements IDeleteWishListRepository {

  final DeleteWishListProvider deleteWishListProvider;

  DeleteWishListAPIRepository({required this.deleteWishListProvider});


  @override
  Future<String> deleteWishListApiResponse(String id) async{
    final response = await deleteWishListProvider.deleteWishListResponseProvider(endPoint: AppConstants.faq, id: id);
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