import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/data/model/store_credit/store_credit_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/store_credit_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class StoreCreditController extends GetxController {
  RxInt index = 0.obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var shoopingbiling = true.obs;

  RxList<StoreCreditModel>? getStoreCreditList = <StoreCreditModel>[].obs;
  NetworkRepository networkRepository = NetworkRepository();

  List storeCreditLIst = [
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹6,999",
      "Balance": "₹15,693",
      "Remarks": "1",
    },
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹1,999",
      "Balance": "₹9,693",
      "Remarks": "2",
    },
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹1,999",
      "Balance": "₹9,693",
      "Remarks": "2",
    },
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹1,999",
      "Balance": "₹9,693",
      "Remarks": "2",
    },
  ];

  StoreCreditAPIRepository storeCreditAPIRepository;
  String? countryCode;

  StoreCreditController(
      {required this.storeCreditAPIRepository, this.countryCode});
  @override
  void onInit() {
    getStoreCredit();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;
//CountrList
  getStoreCredit() async {
    await localStore.getUserDetail();
    print("User Id -> "+localStore.userDetail.id.toString());
    shoopingbiling.value = true;
    var storeCredit =
        jsonDecode(await storeCreditAPIRepository.getStoreCreditResponse(localStore.userDetail.id.toString()));

    print("temas_condition Get $storeCredit");
    if (storeCredit[0]['status'] == "No Data") {
      nodata.value = true;
      messageData.value = "${storeCredit[0]['message']}";
      shoopingbiling.value = false;
    } else {
      getStoreCreditList!.value = List<StoreCreditModel>.from(
        storeCredit.map(
          (privacyPolicy) => StoreCreditModel.fromJson(privacyPolicy),
        ),
      );
      nodata.value = false;
      shoopingbiling.value = false;
    }
  }
}
