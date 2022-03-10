import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';

class AddAddressController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
//TextFiledController-------------------------------------------------
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final zipPovinceController = TextEditingController().obs;
  final address1Controller = TextEditingController().obs;
  final address2Controller = TextEditingController().obs;
  final cityController = TextEditingController().obs;

  //TextFiledController-------------------------------------------------
  final formKey = new GlobalKey<FormState>().obs;
  final List<String> stateList = ["State/Province"];
  final List<String> countryList = ["Country"];
  var selectedState = "".obs;
  var selectedCoutry = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  void addAdress() {
    print("Add Address ${firstNameController.value.text}");
  }
}
