import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class CountryPopUpScreenController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  @override
  void onInit() {
    super.onInit();
  }

  showCountry(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: appColor,
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageConstant.yourAppExpericanceText.tr + ':',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            AppAsset.indianflagIcon,
                            fit: BoxFit.cover,
                            height: 26,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          LanguageConstant.indiaText.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                color: backGroundColor,
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageConstant.englishIsAlsoText.tr,
                      style: TextStyle(),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 14),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: appColor, width: 1.2)),
                          child: Text(
                            LanguageConstant.noThanksText.tr,
                            style: TextStyle(
                                color: appColor, fontWeight: FontWeight.w500),
                          ),
                        )),
                        SizedBox(width: 14),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: appColor,
                              border: Border.all(color: appColor, width: 1.2)),
                          child: Text(
                            LanguageConstant.changeText.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                        SizedBox(width: 14),
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
