import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class ReturnReasonScreen extends StatelessWidget {
  const ReturnReasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            height: 30,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAsset.logo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstant.returnRequestText.tr,
              style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                LanguageConstant.wehaveRecivedText.tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 12),
              ),
            ),
            SizedBox(height: 4),
            Text(
              LanguageConstant.teamSoloLuxuryText.tr,
              style: TextStyle(
                color: Color(0xFF6B6B6B),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 14),
            InkWell(
              onTap: () {
                Get.toNamed(RoutesConstants.dashboardScreen);
              },
              child: Text(
                LanguageConstant.continueShopping.tr.toUpperCase(),
                style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
