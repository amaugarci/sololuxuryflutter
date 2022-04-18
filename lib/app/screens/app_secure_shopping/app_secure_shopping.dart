import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class AppSecureShoppingScreen extends StatelessWidget {
  const AppSecureShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      appBar: commonAppbar(title: LanguageConstant.secureShoppingText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 39),
              const Text(
                "Shop without Worry",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: appColor,
                  decorationThickness: 1.5,
                  color: appColor,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 22),
              Container(
                width: Get.width,
                height: 199,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAsset.appSecure), fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "Fill your cart bursting that all our product are genuine and will be delivered at the time promised. We go further to Secure your shopping with full Insurance",
                textAlign: TextAlign.justify,
                style: commonTextStyle400(),
              ),
              const SizedBox(height: 20),
              Text(
                "We aim to satisfy our clients 100% , however Online shopping is fraught with risks specially when it comes to International Shipping .To give you the peace of mind when you shop from us we have partnered PayPal and Checkout.com , to give you complete security and safety on your purchases.",
                textAlign: TextAlign.justify,
                style: commonTextStyle400(),
              ),
              const SizedBox(height: 20),
              Text(
                "If you pay with PayPal you are covered automatically covered under PayPal Buyer Protection you are covered for the full purchase price plus the original shipping charges if the product is delayed or arrives not as what was described on our website.",
                textAlign: TextAlign.justify,
                style: commonTextStyle400(),
              ),
              const SizedBox(height: 20),
              Text(
                "In addition all other payments are processed thru Checkout.com - the worlds largest and most reputed payment acquiring platform and any disputes can be raised through your bank for immediate resolution.",
                textAlign: TextAlign.justify,
                style: commonTextStyle400(),
              ),
              const SizedBox(height: 91),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Image(
                    image: AssetImage(AppAsset.payPal),
                  ),
                  Image(
                    image: AssetImage(AppAsset.moneyBank),
                  ),
                  Image(
                    image: AssetImage(AppAsset.googleStore),
                  ),
                ],
              ),
              const SizedBox(height: 91),
            ],
          ),
        ),
      ),
    );
  }

  commonTextStyle400() {
    return const TextStyle(
      color: blackColor,
      fontFamily: "OpenSans",
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
  }
}
