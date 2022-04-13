import 'dart:convert';

import 'package:solo_luxury/data/model/Product/product_model.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/main.dart';
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

  Future getRecommendedProductResponse(String id) async {
    print(
        "this is recommended url -> ${AppConstants.recommendedProductsEndPoint + id}");
    final response = await http.get(
      Uri.parse(AppConstants.recommendedProductsEndPoint + id),
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

  Future getSizeListApi(id) async {
    print(
        "URLS --> ${AppConstants.apiEndPointLogin + AppConstants.getSizeListApi + "$id"}");
    final response = await http.get(
        Uri.parse(AppConstants.apiEndPointLogin +
            AppConstants.getSizeListApi +
            "$id"),
        headers: {
          "Content-type": "application/json",
          "Authorization": AppConstants.adminToken
        });
    print('Get Size List ${response.body}');
    try {
      if (response.statusCode == 200) {
        print("Get Size LIst Data=======================================");
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

  Future getChooseinSizeList() async {
    // print("URLS --> ${AppConstants.apiEndPointLogin + AppConstants.getChooseInOptionApi}")
    final response = await http.get(
        Uri.parse(
            AppConstants.apiEndPointLogin + AppConstants.getChooseInOptionApi),
        headers: {
          "Content-type": "application/json",
          "Authorization": AppConstants.adminToken
        });
    // print('Get Choose Option List ${response.body}');

    try {
      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        print(response.statusCode);
        print('Get Choose Option List1 ${response.body}');
        return list;
      } else {
        return null;
      }
    } catch (e) {
      print("ERROR+==============$e");
    }
  }

  Future<Item> getProductDetailApi(id) async {
    final response = await http.get(
        Uri.parse(AppConstants.apiEndPointLogin +
            AppConstants.getProductDetailApi +
            "$id"),
        headers: {
          "Content-type": "application/json",
          "Authorization": AppConstants.adminToken
        });
    print(
        "url -> ${AppConstants.apiEndPointLogin + AppConstants.getProductDetailApi + "$id"}");
    print('Get Size List ${response.body}');
    try {
      if (response.statusCode == 200) {
        print("Get Size LIst Data=======================================");
/*        print(response.body.toString());
        itemData.add(recommendedProductResponseModelFromJson(response.body));*/
        var list = json.decode(response.body);

        /*itemData = json.decode(response.body);

        print("ITEMDATA===================${itemData.toString()}");*/
        print(response.statusCode);
        print("LIST DATA +++++++++++++++++++$list");
        print("LIST DATA +++++++++++++++++++${list}");
        return Item.fromJson(list);
      } else {
        print("###################${response.body}");
        return Item();
      }
    } catch (e) {
      print("ERROR+==============$e");
      return Item();
    }
  }

  Future postAddTOCartProductResponse(addToCartData) async {
    print("Response is $addToCartData");
    final response = await http.post(
        Uri.parse(AppConstants.apiEndPointLogin + AppConstants.addTocartData),
        body: json.encode(addToCartData),
        headers: {
          "Content-type": "application/json",
          "Authorization": localStore.customerToken
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

  // Future postAddTOCartProductResponse(addToCartData) async {
  Future<dynamic> postspecialSizeResponse(
      {required String website,
      required String email,
      required String sku}) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://www.sololuxury.com/rest/V1/notifyMe"));
    request.fields["website"] = "${website.toString()}";
    request.fields["email"] = "${email.toString()}";
    request.fields["sku"] = "${sku.toString()}";
    final response = await request.send().timeout(const Duration(seconds: 60));
    var res = await http.Response.fromStream(response);
    print("response -> " + res.body);
    var json1 = json.decode(res.body);
    return json1;
  }
  // final response = await http.post(
  //     Uri.parse(AppConstants.apiEndPointLogin + AppConstants.addTocartData),
  //     body: json.encode(addToCartData),
  //     headers: {
  //       "Content-type": "application/json",
  //       "Authorization": localStore.customerToken
  //     });
  // try {
  //   if (response.statusCode == 200) {
  //     var list = json.decode(response.body);
  //     print(response.statusCode);
  //     return list;
  //   }
  //   if (response.statusCode == 400) {
  //     return json.decode(response.body);
  //   } else {
  //     print("###################${response.body}");
  //     return null;
  //   }
  // } catch (e) {
  //   print("ERROR+==============$e");
  // }
  // }

  Future getGenerateCartApiResponse(token, createOrderApiEndPoint) async {
    print(
        "Url -> ---------- ${AppConstants.apiEndPointLogin + createOrderApiEndPoint}");
    final response = await http.post(
        Uri.parse(AppConstants.apiEndPointLogin + createOrderApiEndPoint),
        headers: {"Content-type": "application/json", "Authorization": token});

    try {
      if (response.statusCode == 200) {
        print("Categories=======================================");
        print("Categories====================${response.body}");
        var list = json.decode(response.body);
        print("Categories 333====================${list}");
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

  Future guestPostAddTOCartProductResponse(addToCartData, token) async {
    print(
        "Request Posrt Data ${AppConstants.apiEndPointLogin + AppConstants.guestCreateCart + "/$token/items"}");
    print("Request Posrt Data ${addToCartData}");
    final response = await http.post(
      Uri.parse(AppConstants.apiEndPointLogin +
          AppConstants.guestCreateCart +
          "/$token/items"),
      headers: {"Content-type": "application/json"},
      body: json.encode(addToCartData),
    );
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
          "Authorization": localStore.customerToken
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

  Future addTOWishListProductResponse(sku) async {
    var postData = {"email": "parth.vision123@gmail.com"};
    print(
        "Url-> ${AppConstants.apiEndPointLogin + AppConstants.addWishList + "$sku"}");
    final response = await http.put(
      Uri.parse(
          AppConstants.apiEndPointLogin + AppConstants.addWishList + "$sku"),
      headers: {
        "Content-type": "application/json",
        "Authorization": localStore.customerToken
      },
      body: json.encode(postData),
    );
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

  Future deleteWishList(getId) async {
    var postData = {"email": "parth.vision123@gmail.com"};
    print(
        "Url-> ${AppConstants.apiEndPointLogin + AppConstants.addWishList + "$getId"}");
    final response = await http.delete(
      Uri.parse(
          AppConstants.apiEndPointLogin + AppConstants.addWishList + "$getId"),
      headers: {
        "Content-type": "application/json",
        "Authorization": localStore.customerToken
      },
      body: json.encode(postData),
    );
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
}
// @override
// Future getSizeListApi(id) async {
//   final response = await http.get(
//       Uri.parse(
//           AppConstants.apiEndPointLogin + AppConstants.missingSizeApi + "$id"),
//       headers: {
//         "Content-type": "application/json",
//         "Authorization": AppConstants.defaultToken
//       });
//   try {
//     if (response.statusCode == 200) {
//       print("Categories=======================================");
// /*        print(response.body.toString());
//         itemData.add(recommendedProductResponseModelFromJson(response.body));*/
//       var sizeList = json.decode(response.body);
//       /*itemData = json.decode(response.body);

//         print("ITEMDATA===================${itemData.toString()}");*/
//       print(response.statusCode);
//       print("LIST DATA +++++++++++++++++++$sizeList");
//       print("LIST DATA +++++++++++++++++++${sizeList}");
//       return sizeList;
//     } else {
//       print("###################${response.body}");
//       return null;
//     }
//   } catch (e) {
//     print("ERROR+==============$e");
  // }
// }
