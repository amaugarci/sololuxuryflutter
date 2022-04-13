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
  Future<dynamic> postGuestEstimateAPIResponse(String requestJson) async {
    Response estimateResponseModel =
        await provider.postGuestEstimateResponseProvider(
            endPoint: AppConstants.getGuestUrlWithCode(
                AppConstants.estimateMethods),
            requestJson: requestJson);
    if (estimateResponseModel != null) {
      print(AppConstants.apiEndPointLogin +
          AppConstants.getUrlWithCode(
              AppConstants.estimateMethods));
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

  Future<dynamic> postGuestShippingInformationResponse(String requestJson) async {
    Response estimateResponseModel =
        await provider.postGuestShippingInformationResponseProvider(
            endPoint: AppConstants.getGuestUrlWithCode(
                AppConstants.shippingInformation),
            requestJson: requestJson);
    if (estimateResponseModel != null) {
      print(AppConstants.apiEndPointLogin +
          AppConstants.getGuestUrlWithCode(
              AppConstants.shippingInformation));
      print("response.statusCode -> ");
      print(estimateResponseModel.statusCode);
      print(estimateResponseModel.body);
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

  @override
  Future<dynamic> getCountryListResponse() async {
    Response response = await provider.getcountryListAPIResponse(
        endPoint: AppConstants.countryList);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      print("success -> ");
      return response.body!;
    }
  }

  @override
  Future<dynamic> postaddAddressApiResponse(String requestJson) async {
    Response estimateResponseModel = await provider.postAddAddressResponse(
        endPoint: AppConstants.addAddress, requestJson: requestJson);
    print("statusCode -> ${estimateResponseModel.statusCode}");
    if (estimateResponseModel.status.hasError) {
      print("error -> ");
      print(estimateResponseModel.statusText!);
      Validators.apiResponseMessage(
          body: estimateResponseModel.body!,
          message: estimateResponseModel.statusText);
      return null;
    } else {
      print("success -> ");
      return estimateResponseModel.body!;
    }
  }

  Future<dynamic> getAddressListResponse() async {
    final response = await provider.getAddressListAPIResponse(
        endPoint: AppConstants.addressList);
    print("Api Response Error ${response.body!}");
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
