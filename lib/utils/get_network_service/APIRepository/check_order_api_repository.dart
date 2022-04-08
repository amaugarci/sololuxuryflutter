import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/check_order_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../../data/model/checkout_order/multi_address_model.dart';
import '../../../data/model/checkout_order/shipping_information_model.dart';
import '../../validator.dart';

class CheckoutOrderAPIRepository implements ICheckoutOrderRepository {
  final ICheckOutOrderProvider provider;

  CheckoutOrderAPIRepository({required this.provider});

  @override
  Future<dynamic> getMultiAddressAPIResponse() async {
    final multiAddressModelResponse =
        await provider.getMultiAddressResponseProvider(
      endPoint: AppConstants.multiAddressEndPoint,
    );
    if (multiAddressModelResponse != null) {
      print(AppConstants.apiEndPointLogin + AppConstants.multiAddressEndPoint);
      print("response.statusCode -> ");
      print(multiAddressModelResponse.statusCode);
    }
    if (multiAddressModelResponse.status.hasError) {
      Validators.apiResponseMessage(
          body: jsonEncode(multiAddressModelResponse.body!),
          message: multiAddressModelResponse.statusText);
      return null;
    } else {
      print("----->");
      print(multiAddressModelResponse.body!);
      return multiAddressModelResponse.body!;
    }
  }

  @override
  Future<dynamic> postEstimateAPIResponse(String requestJson) async {
    Response estimateResponseModel =
        await provider.postEstimateResponseProvider(
            endPoint: AppConstants.getUrlWithCode(
                AppConstants.estimatesShippingMethodEndPoint),
            requestJson: requestJson);
    if (estimateResponseModel != null) {
      print(AppConstants.apiEndPointLogin +
          AppConstants.getUrlWithCode(
              AppConstants.estimatesShippingMethodEndPoint));
      print("response.statusCode -> ");
      print(estimateResponseModel.statusCode);
    }
    if (estimateResponseModel.status.hasError) {
      Validators.apiResponseMessage(
          body: jsonEncode(estimateResponseModel.body!),
          message: estimateResponseModel.statusText);
      return null;
    } else {
      return estimateResponseModel.body!;
    }
  }

  @override
  Future<dynamic> postShippingInformationAPIResponse(String requestJson) async {
    Response estimateResponseModel =
        await provider.postShippingInformationResponseProvider(
            endPoint: AppConstants.getUrlWithCode(
                AppConstants.shippingInformationEndPoint),
            requestJson: requestJson);
    if (estimateResponseModel != null) {
      print(AppConstants.apiEndPointLogin +
          AppConstants.getUrlWithCode(
              AppConstants.shippingInformationEndPoint));
      print("response.statusCode -> ");
      print(estimateResponseModel.statusCode);
    }
    if (estimateResponseModel.status.hasError) {
      Validators.apiResponseMessage(
          body: jsonEncode(estimateResponseModel.body!),
          message: estimateResponseModel.statusText);
      return null;
    } else {
      return estimateResponseModel.body!;
    }
  }

  @override
  Future<dynamic> postCreateOrderAPIResponse(String requestJson) async {
    Response createOrderApi = await provider.postCreateOrderResponseProvider(
        endPoint: AppConstants.createOrderEndPoint, requestJson: requestJson);
    print("Response IS $createOrderApi");
    if (createOrderApi != null) {
      print("response.statusCode -> ");
      print(createOrderApi.statusCode);
    }
    if (createOrderApi.status.hasError) {
      print("error -> ");
      print(createOrderApi.statusText!);
      Validators.apiResponseMessage(
          body: createOrderApi.body!, message: createOrderApi.statusText);
      return null!;
    } else {
      print("success -> ");
      return createOrderApi.body!;
    }
  }
}
