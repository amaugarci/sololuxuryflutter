// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/check_order_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

import '../../../data/model/checkout_order/estimate_shipping_method_model.dart';
import '../../../data/model/checkout_order/multi_address_model.dart';
import '../home/home_controller.dart';

class CheckoutOrderController extends GetxController {
  Rx<EstimateShippingMethodModel>? estimateShipModel =
      EstimateShippingMethodModel().obs;

  Rx<ShippingInformationModel>? shipInfoModel = ShippingInformationModel().obs;
  RxList? estimatesList = [].obs;
  Rx<MultiAddressModel>? multiAddressModel = MultiAddressModel().obs;
  RxInt selectedAddressIndex = 0.obs;
  RxInt selectedShippingIndex = 0.obs;
  RxInt selectedPaymentIndex = 0.obs;
  RxBool isShowItems = true.obs;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final CheckoutOrderAPIRepository checkoutOrderAPIRepository;

  CheckoutOrderController({required this.checkoutOrderAPIRepository});

  @override
  void onInit() {
    super.onInit();
    getEstimateAndShipInformationFromApi();
  }

  getEstimateAndShipInformationFromApi() async {
    Rx<MultiAddressModel>? multiAddressModel = MultiAddressModel().obs;
    RxInt selectedAddressIndex = 0.obs;
    final response =
        await checkoutOrderAPIRepository.getMultiAddressAPIResponse();
    if (response.isNotEmpty) {
      multiAddressModel.value =
          MultiAddressModel.fromJson(jsonDecode(response));
    }
    if (estimatesList != null) {
      estimatesList?.value = [];
      var params = json.encode({
        "address": {
          "region": "Maharashtra",
          "region_id": 553,
          "region_code": "MH",
          "country_id": "IN",
          "street": ["123 Oak Ave"],
          "postcode": "400012",
          "city": "Mumbai",
          "firstname": "ap",
          "lastname": "test",
          "customer_id": 55,
          "email": "aptest@gmail.com",
          "telephone": "9876988111",
          "same_as_billing": 1
        }
      });
      estimatesList?.value = jsonDecode(
          await checkoutOrderAPIRepository.postEstimateAPIResponse(params));
      // estimatesList?.value = await NetworkRepository().postEstimateShippingMethod() ?? [];
    }

    var params = json.encode({
      "addressInformation": {
        "shipping_address": {
          "region": "Maharashtra",
          "region_id": 553,
          "region_code": "MH",
          "country_id": "IN",
          "street": ["123 Oak Ave"],
          "postcode": "400012",
          "city": "Mumbai",
          "firstname": "ap",
          "lastname": "test",
          "email": "aptest@gmail.com",
          "telephone": "9876988111"
        },
        "billing_address": {
          "region": "Maharashtra",
          "region_code": "MH",
          "country_id": "IN",
          "street": ["123 Oak Ave"],
          "postcode": "400012",
          "city": "Mumbai",
          "firstname": "ap",
          "lastname": "test",
          "email": "aptest@gmail.com",
          "telephone": "9876988111"
        },
        "shipping_carrier_code": "freeshipping",
        "shipping_method_code": "freeshipping"
      }
    });
    shipInfoModel!.value = await checkoutOrderAPIRepository
        .postShippingInformationAPIResponse(params);
    // shipInfoModel!.value = await NetworkRepository().postShippingInformation();
  }

  //Create Order Api Calling ----------------------------
  postListForOrder(cartlist) async {
    // CartModel cartlist = cartList;
    var itemList = [];
    var shippingitemList = [];

    for (var i in shipInfoModel!.value.totals!.items!) {
      itemList.add({
        "is_virtual": "0",
        "name": "${i.name}",
        "original_price": "${i.price}",
        "price": "${i.price}",
        "product_id": "${i.itemId}",
        "product_type": "simple",
        "qty_ordered": "${i.qty}",
        "row_total": "${i.rowTotal}",
        "sku": "".toString(),
        "store_id": "${cartlist.storeId}"
      });
    }
    CartModel cartList = cartlist;

    for (var i in cartList.extensionAttributes!.shippingAssignments!) {
      shippingitemList.add({
        "shipping": {
          "address": {
            "address_type": "shipping",
            "city": "${i.shipping!.address!.city}",
            "company": "Rbj",
            "country_id": "${i.shipping!.address!.countryId}",
            "email": "${i.shipping!.address!.email}",
            "firstname": "${i.shipping!.address!.firstname}",
            "lastname": "${i.shipping!.address!.lastname}",
            "postcode": "${i.shipping!.address!.postcode}",
            "region": "${i.shipping!.address!.region}",
            "region_code": "${i.shipping!.address!.regionCode}",
            "region_id": "${i.shipping!.address!.regionId}",
            "street": [23],
            "telephone": "${i.shipping!.address!.telephone}"
          },
          "method": "flatrate_flatrate"
        }
      });
    }

    print("Segment File Lis Is ${shippingitemList}");
    var postList = {
      "entity": {
        "base_currency_code": "${cartlist.currency!.baseCurrencyCode}",
        "base_grand_total": "${shipInfoModel!.value.totals!.baseGrandTotal}",
        "base_shipping_amount":
            "${shipInfoModel!.value.totals!.shippingAmount}",
        "base_subtotal": "${shipInfoModel!.value.totals!.baseSubtotal}",
        "customer_email": "${cartlist.customer!.email}",
        "customer_firstname": "${cartlist.customer!.firstname}",
        "customer_group_id": "${cartlist.customer!.groupId}",
        "customer_is_guest": "${shipInfoModel!.value.totals!.shippingAmount}",
        "customer_lastname": "${cartlist.customer!.lastname}",
        "grand_total": "${shipInfoModel!.value.totals!.grandTotal}",
        "order_currency_code": "${cartlist.currency!.baseCurrencyCode}",
        "shipping_amount": "${shipInfoModel!.value.totals!.shippingAmount}",
        "shipping_description": "Flat Rate - Fixed",
        "is_virtual": "0",
        "state": "new",
        "status": "pending",
        "store_currency_code": "${cartlist.currency!.storeCurrencyCode}",
        "store_id": "${cartlist.storeId}",
        "store_name": "Main Website\nMain Website Store\n",
        "subtotal": "${shipInfoModel!.value.totals!.subtotal}",
        "subtotal_incl_tax": "${shipInfoModel!.value.totals!.subtotalInclTax}",
        "weight": "1",
        "items": "$itemList",
        "billing_address": {
          "customer_address_id": "${cartlist.billingAddress!.id}",
          "address_type": "shipping",
          "city": "${cartlist.billingAddress!.city}",
          "company": "Rbj",
          "country_id": "${cartlist.billingAddress!.countryId}",
          "email": "${cartlist.billingAddress!.email}",
          "firstname": "${cartlist.billingAddress!.firstname}",
          "lastname": "${cartlist.billingAddress!.lastname}",
          "postcode": "${cartlist.billingAddress!.postcode}".toString(),
          "region": "${cartlist.billingAddress!.region}",
          "region_code": "${cartlist.billingAddress!.regionCode}",
          "region_id": "553",
          "street": [23],
          "telephone": "${cartlist.billingAddress!.telephone}"
        },
        "payment": {
          "method": "CaseOnDelivery",
          "additional_data": "".toString()
        },
        "extension_attributes": {
          "shipping_assignments": "$shippingitemList",
        }
      }
    };

    print("Create Order Api List is ${postList}");
    var postCreateOrder = await checkoutOrderAPIRepository
        .postCreateOrderAPIResponse(json.encode(postList));
    print("Create Order Api Response $postCreateOrder");
  }
}
