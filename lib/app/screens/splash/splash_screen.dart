import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/splash/splash_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import '../login/views/login_screen.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(() => SafeArea(
      child: Scaffold(
        body: Container(
          height: mq.height,
          width: mq.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.backgroundColorValue.value,
          ),
          child: Image.asset(AppAsset.logo,
              height: mq.height * 0.25, width: mq.width * 0.5),
        ),
      ),
    ));
  }
}
