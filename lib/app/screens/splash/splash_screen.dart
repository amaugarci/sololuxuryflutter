import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});

    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: mq.height,
          width: mq.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backGroundColor,
          ),
          child: Image.asset(AppAsset.logo,
              height: mq.height * 0.25, width: mq.width * 0.5),
        ),
      ),
    );
  }
}
