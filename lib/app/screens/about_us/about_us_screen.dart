import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/lang_directory/language_constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      appBar: commonAppbar(title: LanguageConstant.aboutUsText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsText.tr,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: appColor,
                  decorationThickness: 1.5,
                  color: appColor,
                  fontFamily: AppConstants.fontOpenSans,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                LanguageConstant.aboutUsContain1.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsContain2.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsContain3.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsContain4.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsContain5.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsContain6.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.aboutUsContain7.tr,
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  textStyleUtils() {
    return const TextStyle(
      color: grey636363,
      fontFamily: "OpenSans",
      fontWeight: FontWeight.w400,
      height: 1.4,
    );
  }
}
