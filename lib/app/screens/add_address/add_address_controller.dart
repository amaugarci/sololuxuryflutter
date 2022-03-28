import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
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

  CountryListAPIRepository countryListAPIRepository;
  String? countryCode;

  AddAddressController(
      {required this.countryListAPIRepository, this.countryCode});
  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

//CountrList
  getCountryList() async {
    print("getStoreDataFromApi -> ");

    var countryList =
        jsonDecode(await countryListAPIRepository.getCountryListResponse());
    getcountryList.value = List<CountryListModel>.from(countryList
        .map((countryList) => CountryListModel.fromJson(countryList)));
    print("country list Get $getcountryList");
  }

//Api Calling
  addAddress(context, formKey) async {
    if (formKey.currentState!.validate()) {
      final authUserData = json.encode({
        "address": {
          "customer_id": '68',
          "region": {"region_code": "", "region": "", "region_id": 0},
          "country_id": "${selectedCoutry.value.id}",
          "street": [
            "${address1Controller.value.text}",
            "${address2Controller.value.text}"
          ],
          "postcode": "${zipPovinceController.value.text}",
          "city": "${cityController.value.text}",
          "firstname": "${firstNameController.value.text}",
          "lastname": "${lastNameController.value.text}",
          "telephone": "${phoneNumberController.value.text}",
          "countryId": "${selectedCoutry.value.id}",
        }
      });
      dynamic authResponse = await countryListAPIRepository
          .postaddAddressApiResponse(authUserData);
      printLog(authResponse);
      // checkLoginData(authResponse, context);
    } else {}
  }
}
