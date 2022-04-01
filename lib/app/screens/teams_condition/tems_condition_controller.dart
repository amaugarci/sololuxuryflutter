import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/cms_model/cms_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/teams_condition_respository.dart';

class TermAndConditionController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxList<CmsPageModel> getprivacyPolicy = RxList<CmsPageModel>();

  RxInt index = 0.obs;

  List policyData = [
    {
      'policy1': '1. About The Brand & Labels Group And This Privacy Policy',
      'subPolicy':
          'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
    },
    {
      'policy1': '2. Third Party Websites',
      'subPolicy':
          'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
    },
    {
      'policy1': '3. What Information Do We Collect, And How?',
      'subPolicy':
          'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
    }
  ];

  TermAndConditionAPIRepository termAndConditionAPIRepository;
  String? countryCode;
  var htmlDataContent = "".obs;
  var isLoading = true.obs;

  TermAndConditionController(
      {required this.termAndConditionAPIRepository, this.countryCode});

  @override
  void onInit() {
    getPrivacyPolicy();
    super.onInit();
  }

  //CountrList
  getPrivacyPolicy() async {
    isLoading.value = true;
    print("getStoreDataFromApi -> ");

    var privacyPolicy = jsonDecode(
        await termAndConditionAPIRepository.getTermAndConditionResponse());
    getprivacyPolicy.value = List<CmsPageModel>.from(
      privacyPolicy.map(
        (privacyPolicy) => CmsPageModel.fromJson(privacyPolicy),
      ),
    );
    print("country list Get $getprivacyPolicy");
    isLoading.value = false;
  }
}
