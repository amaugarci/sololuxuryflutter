import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/address_list/address_list.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_list_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class AddAddressController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;

  NetworkRepository networkRepository = NetworkRepository();
//TextFiledController-------------------------------------------------
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final zipPovinceController = TextEditingController().obs;
  final address1Controller = TextEditingController().obs;
  final address2Controller = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  List<dynamic>? countryList = [];
  // RxObjectMixin? countryList1 = CountryListModel().obs;
  //TextFiledController-------------------------------------------------
  final formKey = new GlobalKey<FormState>().obs;
  // var selectedState = "".obs;
  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  AddressListModel getAddressList = Get.arguments[0];

  Rx<Address> getUpdateAddressList = Address().obs;

  CountryListAPIRepository countryListAPIRepository;
  String? countryCode;
  var isLoadding = true.obs;
  AddAddressController(
      {required this.countryListAPIRepository, this.countryCode});
  @override
  void onInit() {
    // getUpdateOrNot();
    getCountryList();
    super.onInit();
  }

//CountrLista
  getCountryList() async {
    print("getStoreDataFromApi -> ");

    var countryList =
        jsonDecode(await countryListAPIRepository.getCountryListResponse());
    getcountryList.value = List<CountryListModel>.from(countryList
        .map((countryList) => CountryListModel.fromJson(countryList)));
    print("country list Get $getcountryList");
    getUpdateOrNot();
  }

  getUpdateOrNot() {
    isLoadding.value = true;
    if (Get.arguments[2] == 1) {
      getUpdateAddressList.value = Get.arguments[1];
      firstNameController.value.text = getUpdateAddressList.value.firstname!;
      lastNameController.value.text = getUpdateAddressList.value.lastname!;
      phoneNumberController.value.text = getUpdateAddressList.value.telephone!;
      zipPovinceController.value.text = getUpdateAddressList.value.postcode!;
      address1Controller.value.text = getUpdateAddressList.value.street!.first;
      address2Controller.value.text = getUpdateAddressList.value.street!.first;
      cityController.value.text = getUpdateAddressList.value.city!;
      for (var i in getcountryList) {
        if (i.id.toString() ==
            getUpdateAddressList.value.countryId.toString()) {
          selectedCoutry.value = i;
        }
      }
    }
    isLoadding.value = false;
  }

//Api Calling
  addAddress(context, formKey) async {
    if (formKey.currentState!.validate()) {
      var getList = [].obs;
      for (var i in getAddressList.addresses!) {
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
        "country_id": "${selectedCoutry.value.id.toString()}",
        "street": ["${address1Controller.value.text.toString()}"],
        "Firstname": "${getAddressList.firstname.toString()}",
        "lastname": "${getAddressList.lastname.toString()}",
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
        "email": "${getAddressList.email.toString()}",
        "firstname": "${getAddressList.firstname.toString()}",
        "lastname": "${getAddressList.lastname.toString()}",
        "website_id": 1,
        "addresses": getaddress,
      }
    };
    dynamic authResponse = await countryListAPIRepository
        .postaddAddressApiResponse(json.encode(addaddressPost));
    printLog(authResponse);
    Navigator.pop(context);

    // checkLoginData(authResponse, context);
  }

  //Update Address
  updateAddress(context, formKey) async {
    if (formKey.currentState!.validate()) {
      var getList = [].obs;
      for (var i in getAddressList.addresses!) {
        if (i.id.toString() == getUpdateAddressList.value.id.toString()) {
          print("HEre Is One Time ");
          getList.add({
            "region": {"region_code": "TX", "region": "Texas", "region_id": 12},
            "country_id": "${selectedCoutry.value.id.toString()}",
            "street": ["${address1Controller.value.text.toString()}"],
            "Firstname": "${getAddressList.firstname.toString()}",
            "lastname": "${getAddressList.lastname.toString()}",
            "telephone": "${phoneNumberController.value.text.toString()}",
            "postcode": "${zipPovinceController.value.text.toString()}",
            "city": "${cityController.value.text.toString()}",
            "default_shipping": false,
            "default_billing": false
          });
        } else {
          print("HEre Is Two Time ");
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
      }
      postupdateaddress(context, getList);
    }
  }

  postupdateaddress(context, getaddress) async {
    print("Add Address ${getaddress}");
    var addaddressPost = {
      "customer": {
        "email": "${getAddressList.email.toString()}",
        "firstname": "${getAddressList.firstname.toString()}",
        "lastname": "${getAddressList.lastname.toString()}",
        "website_id": 1,
        "addresses": getaddress,
      }
    };
    dynamic authResponse = await countryListAPIRepository
        .postaddAddressApiResponse(json.encode(addaddressPost));
    printLog(authResponse);
    Navigator.pop(context);

    // checkLoginData(authResponse, context);
  }
}
