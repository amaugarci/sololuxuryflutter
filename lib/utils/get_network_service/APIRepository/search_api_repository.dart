import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/search_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class SearchAPIRepository implements ISearchRepository {
  final SearchAPIProvider searchAPIProvider;

  SearchAPIRepository({required this.searchAPIProvider});

  @override
  Future<BannerListModel> getBannerListAPIResponse() async {
    final response = await searchAPIProvider.getBannerListAPIResponseProvider(
        endPoint: AppConstants.bannerListEndPoint);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }

    // TODO: implement getBannerListAPIResponse
    throw UnimplementedError();
  }

  @override
  Future<MenuModel> getMenuAPIResponse() async {
    final response = await searchAPIProvider.getMenuResponseProvider(
        endPoint: AppConstants.menuEndPoint);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getMenuAPIResponse
    throw UnimplementedError();
  }
}
