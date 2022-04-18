import 'dart:convert';

import 'package:solo_luxury/data/model/Product/product_model.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../../data/model/Wishlist/wishlist_model.dart';
import '../../app_constants.dart';
import '../../validator.dart';
import '../APIProviders/wishlist_api_provider.dart';

class WishListAPIRepository implements IWishListRepository {
  final IWishListProvider wishListProvider;

  WishListAPIRepository({required this.wishListProvider});

  @override
  Future<WishListProductModel> getWishListApiResponse() async {
    final response = await wishListProvider.getWishListResponseProvider(
        endPoint: AppConstants.wishList);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: response.body!, message: response.statusText);
      return null!;
    } else {
      print("success -> ");
      return response.body!;
    }
  }
}
