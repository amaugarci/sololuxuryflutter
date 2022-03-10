import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';

class StoreCreditController extends GetxController {
  RxInt index = 0.obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var shoopingbiling = false.obs;

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

  @override
  void onInit() {
    super.onInit();
  }
}
