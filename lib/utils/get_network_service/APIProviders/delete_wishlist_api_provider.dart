import 'package:get/get.dart';

import '../../app_constants.dart';

abstract class IDeleteWishListProvider {
  Future<Response<String>> deleteWishListResponseProvider({required String endPoint, required String id});
}

class DeleteWishListProvider extends GetConnect implements IDeleteWishListProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<String>> deleteWishListResponseProvider({required String endPoint, required String id}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return delete(endPoint+'/'+id,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

}