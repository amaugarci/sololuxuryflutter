import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/check_order_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../../data/model/checkout_order/shipping_information_model.dart';

class CheckoutOrderAPIRepository implements ICheckoutOrderRepository {

  final ICheckOutOrderProvider provider;

  CheckoutOrderAPIRepository({required this.provider});


  @override
  Future<String> postEstimateAPIResponse(String requestJson) async {
    Response estimateResponseModel = await provider.postEstimateResponseProvider(endPoint: AppConstants.getUrlWithCode(AppConstants.estimatesShippingMethodEndPoint),requestJson: requestJson );
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if(estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return estimateResponseModel.body!;
    }
  }

  @override
  Future<ShippingInformationModel> postShippingInformationAPIResponse(String requestJson) async {
    Response estimateResponseModel = await provider.postShippingInformationResponseProvider(endPoint: AppConstants.getUrlWithCode(AppConstants.shippingInformationEndPoint),requestJson: requestJson );
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if(estimateResponseModel.status.hasError) {
      return Future.error(estimateResponseModel.statusText!);
    } else {
      return ShippingInformationModel.fromJson(jsonDecode(estimateResponseModel.body!));
    }
  }

}