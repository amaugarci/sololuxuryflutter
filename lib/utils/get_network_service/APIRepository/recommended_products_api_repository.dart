import 'dart:convert';

import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:solo_luxury/utils/get_network_service/APIProviders/recommended_products_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

/*class RecommendedProductsAPIRepository
    implements IRecommendedProductsRepository {
  final RecommendedProductsAPIProvider? recommendedProductsAPIProvider;

  RecommendedProductsAPIRepository({this.recommendedProductsAPIProvider});

  @override
  Future<RecommendedProductModel> getMyAccountApiResponse() async {
    final response = await recommendedProductsAPIProvider!
        .getRecommendedProductsProvider(endPoint: AppConstants.menuEndPoint);
    if (response != null) {
      print("response.statusCode -> =================");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getMyAccountApiResponse
    throw UnimplementedError();
  }
}*/
class RecommendedProductsAPIRepository extends GetxController {
  List<RecommendedProductModel> itemData = [];

  Future getRecommendedProductResponse() async {
    final response = await http.get(
      Uri.parse(AppConstants.recommendedProductsEndPoint),
    );
    try {
      if (response.statusCode == 200) {
        print("Categories=======================================");
/*        print(response.body.toString());
        itemData.add(recommendedProductResponseModelFromJson(response.body));*/
        List<dynamic> list = json.decode(response.body);
        /*itemData = json.decode(response.body);

        print("ITEMDATA===================${itemData.toString()}");*/
        print(response.statusCode);
        print("LIST DATA +++++++++++++++++++$list");
        print("LIST DATA +++++++++++++++++++${list[0]["product_id"]}");
        return list;
      } else {
        print("###################${response.body}");
        return null;
      }
    } catch (e) {
      print("ERROR+==============$e");
    }
  }

  Future getSizeListApi() async {
    final response = await http.get(
        Uri.parse(
            AppConstants.apiEndPointNew2 + AppConstants.getSizeListApi + "539"),
        headers: {
          "Content-type": "application/json",
          "Authorization": AppConstants.defaultToken
        });
    try {
      if (response.statusCode == 200) {
        print("Categories=======================================");
/*        print(response.body.toString());
        itemData.add(recommendedProductResponseModelFromJson(response.body));*/
        var list = json.decode(response.body);
        /*itemData = json.decode(response.body);

        print("ITEMDATA===================${itemData.toString()}");*/
        print(response.statusCode);
        print("LIST DATA +++++++++++++++++++$list");
        print("LIST DATA +++++++++++++++++++${list}");
        return list;
      } else {
        print("###################${response.body}");
        return null;
      }
    } catch (e) {
      print("ERROR+==============$e");
    }
  }

  Future postAddTOCartProductResponse(addToCartData) async {
    final response = await http.post(
        Uri.parse(AppConstants.apiEndPointLogin + AppConstants.addTocartData),
        body: json.encode(addToCartData),
        headers: {
          "Content-type": "application/json",
          "Authorization": AppConstants.cartToken
        });
    try {
      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        print(response.statusCode);
        return list;
      }
      if (response.statusCode == 400) {
        return json.decode(response.body);
      } else {
        print("###################${response.body}");
        return null;
      }
    } catch (e) {
      print("ERROR+==============$e");
    }
  }

  Future getCreateCartApiResponse() async {
    final response = await http.get(
        Uri.parse(AppConstants.apiEndPointLogin + AppConstants.createCart),
        headers: {
          "Content-type": "application/json",
          "Authorization": AppConstants.cartToken
        });
    try {
      if (response.statusCode == 200) {
        print("Categories=======================================");
        var list = json.decode(response.body);
        print(response.statusCode);
        print("LIST DATA +++++++++++++++++++$list");
        return list;
      } else {
        print("###################${response.body}");
        return null;
      }
    } catch (e) {
      print("ERROR))))))+==============$e");
    }
  }
}
