import 'dart:convert';

import 'package:solo_luxury/utils/get_network_service/APIProviders/delete_wishlist_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';
import '../../validator.dart';
import '../APIProviders/post_wishlist_api_provider.dart';

class PostWishListAPIRepository implements IPostWishListRepository {
  final PostWishListAPIProvider postWishListAPIProvider;

  PostWishListAPIRepository({required this.postWishListAPIProvider});

  @override
  Future<dynamic> postWishListApiResponse(String sku) async {
    final response = await postWishListAPIProvider.postWishListResponseProvider(
        endPoint: AppConstants.faq, sku: sku);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: response.body!, message: response.statusText);
      return null;
    } else {
      print("success -> ");
      return response.body!;
    }
  }
}
