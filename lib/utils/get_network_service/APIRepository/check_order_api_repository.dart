import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/check_order_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../../data/model/checkout_order/multi_address_model.dart';
import '../../../data/model/checkout_order/shipping_information_model.dart';

class CheckoutOrderAPIRepository implements ICheckoutOrderRepository {

  final ICheckOutOrderProvider provider;

  CheckoutOrderAPIRepository({required this.provider});


  @override
  Future<String> getMultiAddressAPIResponse() async {
    final multiAddressModelResponse = await provider.getMultiAddressResponseProvider(endPoint: AppConstants.multiAddressEndPoint,);
    print("statusCode -> ${multiAddressModelResponse.statusCode}");
    if(multiAddressModelResponse.status.hasError) {
      return Future.error(multiAddressModelResponse.statusText!);
    } else {
      print("----->");
      print(multiAddressModelResponse.body!);
      return multiAddressModelResponse.body!;
    }
  }

  @override
  Future<String> postEstimateAPIResponse(String requestJson) async {
    Response estimateResponseModel = await provider.postEstimateResponseProvider(endPoint: AppConstants.estimatesShippingMethodEndPoint,requestJson: requestJson );
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if(estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return estimateResponseModel.body!;
    }
  }

  @override
  Future<ShippingInformationModel> postShippingInformationAPIResponse(String requestJson) async {
    Response estimateResponseModel = await provider.postShippingInformationResponseProvider(endPoint: AppConstants.shippingInformationEndPoint,requestJson: requestJson );
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if(estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return ShippingInformationModel.fromJson(jsonDecode(estimateResponseModel.body!));
    }
  }

}