/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            Text(
              'Test Donation Two',
              style: TextStyle(
                color: appColor,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                priceWidget(5),
                priceWidget(10),
                priceWidget(15),
                priceWidget(25),
                priceWidget(50),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'Choose Your Own Amount GBP\n(Minimum 1)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            amountTextField(),
            const SizedBox(height: 15),
            const Text(
              'The selected Amount will be Added To Your\nShopping cart.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            donateButton()
          ],
        ),
      ),
    );
  }

  Widget priceWidget(int value) {
    return Container(
      height: 27,
      width: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: appColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '£ $value',
        style: TextStyle(color: appColor),
      ),
    );
  }

  Widget amountTextField() {
    return Container(
      height: 42.5,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: appColor, width: 1.25),
      ),
      child: Row(
        children: [
          Container(
            height: 42.5,
            width: 60,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(color: appColor, width: 1.25),
            ),
            alignment: Alignment.center,
            child: const Text(
              'GBP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
              ),
            ),
          ),
          const Expanded(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black54, fontSize: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  Widget donateButton() {
    return SizedBox(
      width: 250,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          'I WANT TO DONATE THIS AMOUNT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.8,
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/screens/donation/charity_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/app_constants.dart';

class CharityScreen extends GetView<CharityController> {
  const CharityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      appBar: commonAppbar(title: LanguageConstant.hopeText.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(
                  LanguageConstant.charityTitle.tr,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: appColor,
                    decorationThickness: 1.5,
                    color: appColor,
                    fontFamily: AppConstants.fontOpenSans,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstant.charityContain1.tr,
                  textAlign: TextAlign.center,
                  style: commonStyle400(),
                ),
                const SizedBox(
                  height: 40,
                ),
                commonContainer(
                  height: 294.0,
                  imageUrl: AppAsset.charity1,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstant.charityContain2.tr,
                  textAlign: TextAlign.justify,
                  style: commonStyle400(textSize: 16.0),
                ),
                const SizedBox(
                  height: 30,
                ),
                commonContainer(
                  height: 294.0,
                  imageUrl: AppAsset.charity2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstant.charityContain3.tr,
                  textAlign: TextAlign.justify,
                  style: commonStyle400(textSize: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstant.charityContain4.tr,
                  textAlign: TextAlign.justify,
                  style: commonStyle400(textSize: 16.0),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  commonStyle400({var textSize}) {
    return  TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
      fontSize:textSize?? 16,
    );
  }

  commonContainer({var height, var imageUrl}) {
    return Container(
      height: height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
      ),
    );
  }
}
