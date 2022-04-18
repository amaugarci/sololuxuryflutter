import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/splash_api_repository.dart';

import '../../../main.dart';
import '../../../utils/get_network_service/APIProviders/country_api_provider.dart';
import '../../services/notification_service.dart';
import '../country/country_controller.dart';

class SplashController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  SplashAPIRepository splashAPIRepository;

  SplashController({required this.splashAPIRepository});
  @override
  void onInit() {
    setLocalStore();

    super.onInit();
  }

  setLocalStore() async {
    await getFCMToken();
    await localStore.getToken();
    localStore.checkGuest();
    bool isCall = await localStore.getStore();
    print("isCall -> $isCall");
    if (!isCall) {
      String countryCode = await splashAPIRepository.getSplashAPIResponse();
      print("countryCode---> $countryCode");
      Get.put(CountryController(
          countryAPIRepository:
              CountryAPIRepository(countryAPIProvider: CountryAPIProvider()),
          countryCode: countryCode,
          selectPopUp: "1"));
    }
    _navigate();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      Get.offAllNamed(RoutesConstants.dashboardScreen);
    });
  }
}
