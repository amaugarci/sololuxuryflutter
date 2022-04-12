import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/address_list/address_list.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/address_list_api_repository.dart';

class AddressBookController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  AddressListAPIRepository addressListAPIRepository;
  String? countryCode;
  var isLoading = true.obs;
  Rx<AddressListModel> getAdressList = AddressListModel().obs;

  AddressBookController(
      {required this.addressListAPIRepository, this.countryCode});

  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

//CountrList
  getAddressList() async {
    isLoading.value = true;
    var addressList =
        jsonDecode(await addressListAPIRepository.getAddressListResponse());
    print("Details Of Address ${addressList}");
    getAdressList.value = AddressListModel.fromJson(addressList);
    print("Address List Is $getAdressList");
    isLoading.value = false;
  }
}
