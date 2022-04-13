// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/address_list/address_list.dart';
import 'package:solo_luxury/data/model/checkout_order/multi_address_model.dart'
    as MultiAddress;
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/check_order_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

import '../../../data/model/cart/cart_model.dart';
import '../../../data/model/checkout_order/estimate_shipping_method_model.dart';
import '../../../data/model/checkout_order/multi_address_model.dart';
import '../../../main.dart';
import '../../../utils/app_constants.dart';
import '../home/home_controller.dart';

class CheckoutOrderController extends GetxController {
  Rx<EstimateShippingMethodModel>? estimateShipModel =
      EstimateShippingMethodModel().obs;

  Rx<ShippingInformationModel>? shipInfoModel = ShippingInformationModel().obs;
  RxList? estimatesList = [].obs;
  Rx<MultiAddressModel>? multiAddressModel = MultiAddressModel().obs;
  Rx<MultiAddressModel>? billingMultiAddressModel = MultiAddressModel().obs;
  RxInt selectedAddressIndex = 0.obs;
  RxInt selectedShippingIndex = 0.obs;
  RxInt selectedPaymentIndex = 0.obs;
  RxInt selectedBillingIndex = 0.obs;
  RxBool isSameAsBilling = true.obs;
  RxBool isShowItems = true.obs;
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  MultiAddress.Address shippingAddress = MultiAddress.Address();
  MultiAddress.Address billingAddress = MultiAddress.Address();

  final CheckoutOrderAPIRepository checkoutOrderAPIRepository;

  CheckoutOrderController({required this.checkoutOrderAPIRepository});

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final zipPovinceController = TextEditingController().obs;
  final address1Controller = TextEditingController().obs;
  final address2Controller = TextEditingController().obs;
  final address3Controller = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;

  final billingFirstNameController = TextEditingController().obs;
  final billingLastNameController = TextEditingController().obs;
  final billingPhoneNumberController = TextEditingController().obs;
  final billingZipPovinceController = TextEditingController().obs;
  final billingAddress1Controller = TextEditingController().obs;
  final billingAddress2Controller = TextEditingController().obs;
  final billingAddress3Controller = TextEditingController().obs;
  final billingCityController = TextEditingController().obs;
  final billingStateController = TextEditingController().obs;

  RxString firstName = "".obs,lastName = "".obs,add1 = "".obs,add2 = "".obs,add3 = "".obs,city = "".obs,countryName = "".obs,state = "".obs, zipCode = "".obs, phone = "".obs ;
  RxString firstNameBilling = "".obs,lastNameBilling = "".obs,add1Billing = "".obs,add2Billing = "".obs,add3Billing = "".obs,cityBilling = "".obs,countryNameBilling = "".obs,stateBilling = "".obs, zipCodeBilling = "".obs, phoneBilling = "".obs ;


  Rx<CountryListModel> selectedCoutry1 = CountryListModel().obs;
  Rx<CountryListModel> selectedCoutry2 = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();

  var selectedCoutry = "".obs;
  var saveAddressBook = 1.obs;

  @override
  void onInit() {
    super.onInit();
    print("localStore.isGuest -> ${localStore.isGuest}");
    getCountryList();
    if(localStore.isGuest){
      getGuestEstimateAndShipInformationFromApi();
    }else {
      getAddressList();
      getEstimateAndShipInformationFromApi();
    }
  }

  getGuestEstimateAndShipInformationFromApi({paramShipping,paramBilling}) async {
    print("Guest Shipping Information -> ");
    isLoading.value = true;
    var params = json.encode({
      "address": {
        "region": "Maharashtra",
        "region_id": 553,
        "region_code": "MH",
        "country_id": "IN",
        "street": [
          "123 Oak Ave"
        ],
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
    if(paramShipping!=null){
      params = paramShipping;
    }
    print("Shiping param :- $params");
    var data =
    await checkoutOrderAPIRepository.postGuestEstimateAPIResponse(params);
    if (data != null) {
      estimatesList?.value = [];
      String dataString = jsonEncode(data);
      estimatesList?.value = jsonDecode(dataString);
    }

    // estimatesList?.value = await NetworkRepository().postEstimateShippingMethod() ?? [];

    var params1 = jsonEncode({   "addressInformation": {     "shipping_address": {       "region": "Maharashtra",     "region_id": 553,     "region_code": "MH",     "country_id": "IN",     "street": [       "123 Oak Ave"     ],     "postcode": "400012",     "city": "Mumbai",     "firstname": "ap",     "lastname": "test",     "email": "aptest@gmail.com",     "telephone": "9876988111"     },     "billing_address": {       "region": "Maharashtra", "region_id": 553,  "region_code": "MH",     "country_id": "IN",     "street": [       "123 Oak Ave"     ],     "postcode": "400012",     "city": "Mumbai",     "firstname": "ap",     "lastname": "test",     "email": "aptest@gmail.com",     "telephone": "9876988111"     },     "shipping_carrier_code": "freeshipping",     "shipping_method_code": "freeshipping"   } });
    if(paramBilling!=null){
      params1 = paramBilling;
    }
    print("Shipping Billing Param :- $params");
    var data1 = await checkoutOrderAPIRepository.postGuestShippingInformationResponse(params1);
    if(data1 != null){
      String dataString =  jsonEncode(data1);
      shipInfoModel!.value =
          ShippingInformationModel.fromJson(jsonDecode(dataString));
    }
    isLoading.value = false;
  }
  getEstimateAndShipInformationFromApi() async {
    var data = await checkoutOrderAPIRepository.getMultiAddressAPIResponse();
    if (data != null) {
       String dataString = jsonEncode(data);
       print("dataString -> ${dataString}");
      multiAddressModel!.value =
          MultiAddressModel.fromJson(json.decode(dataString));
       billingMultiAddressModel!.value =
          MultiAddressModel.fromJson(json.decode(dataString));
      if (multiAddressModel != null) {
        estimateAndShippingAPICall(
          multiAddressModel!.value.addresses!.first,
          multiAddressModel!.value.addresses!.first,
        );
        if(multiAddressModel!.value.addresses!.isNotEmpty){
          shippingAddress = multiAddressModel!.value.addresses!.first;
        }
      }
    }
    // shipInfoModel!.value = await NetworkRepository().postShippingInformation();
  }

  estimateAndShippingAPICall(MultiAddress.Address address, MultiAddress.Address billingAddress,) async {
    isLoading.value = true;
    var params = json.encode({
      "address": {
        "region": "${billingAddress.region!.region}",
        "region_id": billingAddress.region!.regionId,
        "region_code": "${billingAddress.region!.regionCode}",
        "country_id": "${billingAddress.countryId}",
        "street": billingAddress.street,
        "postcode": "${billingAddress.postcode}",
        "city": "${billingAddress.city}",
        "firstname": "${billingAddress.firstname}",
        "lastname": "${billingAddress.lastname}",
        "customer_id": billingAddress.customerId,
        "email": multiAddressModel!.value.email,
        "telephone": "${billingAddress.telephone}",
        "same_as_billing": 1
      }
    });
    print("Estimate param :- $params");
    var data1 =
        await checkoutOrderAPIRepository.postEstimateAPIResponse(params);
    if (data1 != null) {
      estimatesList?.value = [];
      String dataString = jsonEncode(data1);
      estimatesList?.value = jsonDecode(dataString);
    }

    // estimatesList?.value = await NetworkRepository().postEstimateShippingMethod() ?? [];

    var params1 = json.encode({
      "addressInformation": {
        "shipping_address": {
          "region": "${address.region!.region}",
          "region_id": address.region!.regionId,
          "region_code": "${address.region!.regionCode}",
          "country_id": "${address.countryId}",
          "street": address.street,
          "postcode": "${address.postcode}",
          "city": "${address.city}",
          "firstname": "${address.firstname}",
          "lastname": "${address.lastname}",
          "email": "${multiAddressModel!.value.email}",
          "telephone": "${address.telephone}",
          "same_as_billing": 1,
        },
        "billing_address": {
          "region": "${billingAddress.region!.region}",
          "region_code": "${billingAddress.region!.regionCode}",
          "country_id": "${billingAddress.countryId}",
          "street": billingAddress.street,
          "postcode": "${billingAddress.postcode}",
          "city": "${billingAddress.city}",
          "firstname": "${billingAddress.firstname}",
          "lastname": "${billingAddress.lastname}",
          "email": "${multiAddressModel!.value.email}",
          "telephone": "${billingAddress.telephone}"
        },
        "shipping_carrier_code": "freeshipping",
        "shipping_method_code": "freeshipping"
      }
    });
    print("Params 1 -> $params1");
    var data2 = await checkoutOrderAPIRepository
        .postShippingInformationAPIResponse(params1);
    if (data2 != null) {
      String dataString = jsonEncode(data2);
      shipInfoModel!.value =
          ShippingInformationModel.fromJson(jsonDecode(dataString));
    }

    isLoading.value = false;
  }

  //TODO : Payment Response using Platform Channel

  Future<void> responseFromNativeCode(
      cartData, context, Map<String, dynamic> paymentRequest) async {
    String response = "";
    try {
      final String result =
          await platform.invokeMethod('helloFromNativeCode', paymentRequest);
      response = result;
      Map<String, dynamic> map = jsonDecode(response);
      print("result -> ${map.toString()}");
      print("result -> ${map['resultCode']}");
      Get.snackbar("Authorised", "The payment was successful.",
          backgroundColor: const Color(0xFF5EFF5B));
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }

    Map<String, dynamic> map = jsonDecode(response);
    print("Response Map Is Her $map");
    if (map['resultCode'] == "Authorised") {
      await postListForOrder(
          cartData, "adyen_cc", "${map.toString()}", context);
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: 'Something went wrong. Please try again',
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      )..show();
    }
  }

  //Create Order Api Calling ----------------------------
  postListForOrder(cartlist, method, paymentId, context) async {
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
          "method": "$method",
          "additional_data": "${paymentId}".toString()
        },
        "extension_attributes": {
          "shipping_assignments": "$shippingitemList",
        }
      }
    };

    print("Create Order Api List is ${postList}");
    var postCreateOrder = await checkoutOrderAPIRepository
        .postCreateOrderAPIResponse(json.encode(postList));
    //print("Create Order Api Response $postCreateOrder");
    if (postCreateOrder != null) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Success',
        desc: 'Your Order is Succressfully.',
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      )..show();
    }
  }

  //Add Address PopUP
  // Rx<AddressListModel> getAdressList = AddressListModel().obs;

  getCountryList() async {
    print("getStoreDataFromApi -> ");

    var data = await checkoutOrderAPIRepository.getCountryListResponse();
    if(data!=null){
      String dataString = jsonEncode(data);
      getcountryList.value = List<CountryListModel>.from(jsonDecode(dataString)
          .map((countryList) => CountryListModel.fromJson(countryList)));
      print("country list Get $getcountryList");
    }
  }

//CountrList
  Rx<AddressListModel> getAdressList1 = AddressListModel().obs;
  getAddressList() async {
    // isLoading.value = true;
    var data = await checkoutOrderAPIRepository.getAddressListResponse();
    if(data!=null){
      String dataString = jsonEncode(data);
      print("Details Of Address ${dataString}");
    getAdressList1.value = AddressListModel.fromJson(jsonDecode(dataString));
    print("Address List Is $getAdressList1");
    }

    // isLoading.value = false;
  }

//Api Calling

  addAddress(context, formKey) async {
    if (formKey.currentState!.validate()) {

      var getList = [].obs;
      for (var i in getAdressList1.value.addresses!) {
        getList.add({
          "region": i.region,
          "country_id": "${i.countryId}",
          "street": i.street,
          "Firstname": "${i.firstname}",
          "lastname": "${i.lastname}",
          "telephone": "${i.telephone}",
          "postcode": "${i.postcode}",
          "city": "${i.city}",
          "default_shipping": false,
          "default_billing": false
        });
      }
      getList.add({
        "region": {"region_code": "TX", "region": "Texas", "region_id": 12},
        "country_id": "${selectedCoutry1.value.id.toString()}",
        "street": ["${address1Controller.value.text.toString()}"],
        "Firstname": "${getAdressList1.value.firstname.toString()}",
        "lastname": "${getAdressList1.value.lastname.toString()}",
        "telephone": "${phoneNumberController.value.text.toString()}",
        "postcode": "${zipPovinceController.value.text.toString()}",
        "city": "${cityController.value.text.toString()}",
        "default_shipping": false,
        "default_billing": false
      });

      postaddress(context, getList);
    }
  }

  postaddress(context, getaddress) async {
    print("Add Address ${getaddress}");
    var addaddressPost = {
      "customer": {
        "email": "${getAdressList1.value.email.toString()}",
        "firstname": "${getAdressList1.value.firstname.toString()}",
        "lastname": "${getAdressList1.value.lastname.toString()}",
        "website_id": 1,
        "addresses": getaddress,
      }
    };
    dynamic authResponse = await checkoutOrderAPIRepository
        .postaddAddressApiResponse(json.encode(addaddressPost));
    printLog(authResponse);
    Navigator.pop(context);

    // checkLoginData(authResponse, context);

  }

  //Add To Cart Open Dialog3
  void showDialogAddress(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(() => AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              backgroundColor: Color(0xffFBECE5),
              content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          LanguageConstant.shippingAddressText.tr,
                          style: TextStyle(
                              color: appColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.clear,
                            color: appColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            // width: 140,
                            child: TextFormField(
                              controller: firstNameController.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "First Name",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter First Name";
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: Container(
                            height: 40,
                            width: 140,
                            child: TextFormField(
                              controller: lastNameController.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "Last Name",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter Last Name";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: address1Controller.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "Street Address 1",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter Street Address";
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: cityController.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "City",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter City";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: address2Controller.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "Street Address 2",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter Street Address";
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 8.0, right: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: appColor.withOpacity(0.6), width: 1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CountryListModel>(
                                dropdownColor: backGroundColor,
                                items: getcountryList
                                    .map((value) =>
                                        DropdownMenuItem<CountryListModel>(
                                          child: Text(
                                              value.fullNameEnglish.toString()),
                                          value: value,
                                        ))
                                    .toList(),
                                isExpanded: true,
                                hint: selectedCoutry1.value.fullNameEnglish
                                            .toString() ==
                                        "null"
                                    ? Text(
                                        "Country",
                                        style: TextStyle(color: appColor),
                                      )
                                    : Text(
                                        selectedCoutry1.value.fullNameEnglish
                                            .toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 28,
                                  color: appColor.withOpacity(0.2),
                                ),
                                onChanged: (value) {
                                  print("value Is $value");
                                  selectedCoutry1.value = value!;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: address3Controller.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "Street Address 3",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter Street Address";
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              controller: stateController.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "State/Province",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter State/Province";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: zipPovinceController.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "Zip/Postal Code",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter Zip Postal Code";
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: phoneNumberController.value,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 12, left: 10),
                                hintText: "Phone Number",
                                hintStyle:
                                    TextStyle(color: appColor, fontSize: 14),
                                errorStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor.withOpacity(0.6),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Enter Phone Number";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            saveAddressBook.value = 0;
                          },
                          child: Container(
                            height: 18,
                            width: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: appColor)),
                            child: saveAddressBook.value == 1
                                ? Icon(
                                    Icons.check,
                                    color: appColor,
                                    size: 16,
                                  )
                                : Container(),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          LanguageConstant.saveInAddressBookText.tr,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            addAddress(context, formKey);
                          },
                          child: Text(
                            LanguageConstant.shipHereText.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: appColor),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0, color: appColor.withOpacity(0.6)),
                            primary: appColor.withOpacity(0.6),
                            shape: StadiumBorder(),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            LanguageConstant.cancelText.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: appColor),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0, color: appColor.withOpacity(0.6)),
                            shape: StadiumBorder(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  shippingValidationAddress(){
    if(firstName.isNotEmpty && lastName.isNotEmpty && add1.isNotEmpty && city.isNotEmpty && add2.isNotEmpty && countryName.isNotEmpty && add3.isNotEmpty && state.isNotEmpty && zipCode.isNotEmpty && phone.isNotEmpty){
        AppConstants.dismissKeyboard();

        var params = json.encode({
          "address": {
            "region": state.value,
            "country_id": selectedCoutry1.value.id,
            "street": [
              add1.value,
              add2.value,
              add3.value,
            ],
            "postcode": zipCode.value,
            "city": city.value,
            "firstname": firstName.value,
            "lastname": lastName.value,
            // "email": email,
            "telephone": phone.value,
            "same_as_billing": 1
          }
        });

        getGuestEstimateAndShipInformationFromApi(paramShipping: params,);
    }
  }

  billingValidationAddress(){
    if(firstNameBilling.isNotEmpty && lastNameBilling.isNotEmpty && add1Billing.isNotEmpty &&cityBilling.isNotEmpty && add2Billing.isNotEmpty && countryNameBilling.isNotEmpty && add3Billing.isNotEmpty && stateBilling.isNotEmpty && zipCodeBilling.isNotEmpty && phoneBilling.isNotEmpty){
      AppConstants.dismissKeyboard();
        var params1 = jsonEncode({
          "addressInformation": {
            "shipping_address": {
              "region": state.value,
              "country_id": selectedCoutry1.value.id,
              "street": [
                add1.value,
                add2.value,
                add3.value,
              ],
              "postcode": zipCode.value,
              "city": city.value,
              "firstname": firstName.value,
              "lastname": lastName.value,
              // "email": "aptest@gmail.com.value",
              "telephone": phone.value,
            },
            "billing_address": {
              "region": stateBilling.value,
              "country_id": selectedCoutry2.value.id,
              "street": [
                add1Billing.value,
                add2Billing.value,
                add3Billing.value,
              ],
              "postcode": zipCodeBilling.value,
              "city": cityBilling.value,
              "firstname": firstNameBilling.value,
              "lastname": lastNameBilling.value,
              // "email": "aptest@gmail.com.value",
              "telephone": phoneBilling.value
            },
            "shipping_carrier_code": "freeshipping",
            "shipping_method_code": "freeshipping"
          }
        });

        getGuestEstimateAndShipInformationFromApi(paramBilling: params1);
    }
  }

}
