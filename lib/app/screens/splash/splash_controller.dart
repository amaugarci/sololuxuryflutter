import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/tickets/my_tickets_screen.dart';
import 'package:solo_luxury/utils/app_routes.dart';

class SplashController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;

  @override
  void onInit() {
    _navigate();
    super.onInit();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 2), () async  {
      Get.offAllNamed(RoutesConstants.filterScreen);
    });
  }
}
