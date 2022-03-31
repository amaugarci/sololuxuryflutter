import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/Product/product_model.dart';
import 'package:solo_luxury/data/model/search/get_product_data_model.dart';
import 'package:solo_luxury/data/model/search/search_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/search_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

class SearchAPIRepository implements ISearchRepository {
  final SearchAPIProvider searchAPIProvider;

  SearchAPIRepository({required this.searchAPIProvider});

  /*@override
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
  }*/

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

  @override
  Future<SearchModel> getSearchAPIResponse({var argument}) async {
    final response = await searchAPIProvider.getSearchResponseProvider(
        endPoint:
            "/rest/V1/search?searchCriteria[requestName]=quick_search_container&searchCriteria[filter_groups][0][filters][0][field]=search_term&searchCriteria[filter_groups][0][filters][0][value]=$argument");
    if (response != null) {
      print("response.statusCode SEARCH-=======> ");
      print(response.statusCode);
      print("response.bodySEARCH -=======> ${response.statusText}");
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getSearchAPIResponse
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getSearchProductAPIResponse({itemID}) async {
    final response = await searchAPIProvider.getSearchProductResponseProvider(
        endPoint:
            "/rest/V1/products?searchCriteria[filter_groups][0][filters][0][field]=entity_id&searchCriteria[filter_groups][0][filters][0][value]=$itemID&searchCriteria[filter_groups][0][filters][0][condition_type]=in");
    if (response != null) {
      print("response.statusCode PRODUCT-=======> ");
      print(response.statusCode);
      print("response.body PRODUCT-=======> ${response.statusText}");
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getSearchProductAPIResponse
    throw UnimplementedError();
  }
}
