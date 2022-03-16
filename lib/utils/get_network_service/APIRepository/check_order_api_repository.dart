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
    if (multiAddressModelResponse != null) {
      print(AppConstants.apiEndPointLogin + AppConstants.multiAddressEndPoint);
      print("response.statusCode -> ");
      print(multiAddressModelResponse.statusCode);
    }
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
    Response estimateResponseModel = await provider.postEstimateResponseProvider(endPoint: AppConstants.getUrlWithCode(AppConstants.estimatesShippingMethodEndPoint),requestJson: requestJson );
    if (estimateResponseModel != null) {
      print(AppConstants.apiEndPointLogin + AppConstants.getUrlWithCode(AppConstants.estimatesShippingMethodEndPoint));
      print("response.statusCode -> ");
      print(estimateResponseModel.statusCode);
    }
    if(estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return estimateResponseModel.body!;
    }
  }

  @override
  Future<ShippingInformationModel> postShippingInformationAPIResponse(String requestJson) async {
    Response estimateResponseModel = await provider.postShippingInformationResponseProvider(endPoint: AppConstants.getUrlWithCode(AppConstants.shippingInformationEndPoint),requestJson: requestJson );
    if (estimateResponseModel != null) {
      print(AppConstants.apiEndPointLogin + AppConstants.getUrlWithCode(AppConstants.shippingInformationEndPoint));
      print("response.statusCode -> ");
      print(estimateResponseModel.statusCode);
    }
    if(estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return ShippingInformationModel.fromJson(jsonDecode(estimateResponseModel.body!));
    }
  }

}