import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:solo_luxury/app/screens/filter/filter_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/CheckBoxListTileModel.dart';
import '../../utils/app_asset.dart';

class ListFilterPage extends GetView<FilterController> {
  ListFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: backGroundColor,
        body: Container(
            child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 60),
            Container(
                child: Image.asset(
              AppAsset.logo,
              height: 50,
              width: 150,
            )),
            SizedBox(height: 40),
            Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: brownColor)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      decoration: BoxDecoration(color: lightBrownColor),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    LanguageConstant.filtersText.tr,
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.close,
                                  size: 25.0,
                                  color: appColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: brownColor)),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: brownColor)),
                                      width: Get.width * .42,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.sizeClicked.value =
                                                  false;
                                              controller.brandClicked.value =
                                                  false;
                                              controller.colorClicked.value =
                                                  false;
                                              controller.priceClicked.value =
                                                  true;
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                            .priceClicked.value
                                                        ? backGroundColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      LanguageConstant
                                                          .priceText.tr,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: appColor)),
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sizeClicked.value =
                                                  false;
                                              controller.brandClicked.value =
                                                  false;
                                              controller.colorClicked.value =
                                                  true;
                                              controller.priceClicked.value =
                                                  false;
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                            .colorClicked.value
                                                        ? backGroundColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    LanguageConstant
                                                        .colorText.tr,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: appColor),
                                                  ),
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sizeClicked.value =
                                                  false;
                                              controller.brandClicked.value =
                                                  true;
                                              controller.colorClicked.value =
                                                  false;
                                              controller.priceClicked.value =
                                                  false;
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                            .brandClicked.value
                                                        ? backGroundColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      LanguageConstant
                                                          .brandText.tr,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: appColor)),
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sizeClicked.value =
                                                  true;
                                              controller.brandClicked.value =
                                                  false;
                                              controller.colorClicked.value =
                                                  false;
                                              controller.priceClicked.value =
                                                  false;
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                            .sizeClicked.value
                                                        ? backGroundColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      LanguageConstant
                                                          .sizeText.tr,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: appColor)),
                                                )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: brownColor)),
                                      width: Get.width * .42,
                                      child: priceFilterWidget()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 50),
            Container(
                height: 40,
                decoration: BoxDecoration(
                    color: appColor,
                    border: Border.all(width: 1, color: brownColor)),
                width: Get.width * .9,
                child: Center(
                    child: Text(
                  LanguageConstant.applyText.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ))),
          ]),
        ))));
  }

  Widget priceFilterWidget() {
    List<CheckBoxListTileModel> data1 = getData();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(5),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: brownColor)),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: brownColor,
                ),
                Text(
                  LanguageConstant.searchText.tr,
                  style: TextStyle(color: brownColor),
                ),
              ],
            )),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              primary: false, // <- add
              itemCount: getData().length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    new CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                        activeColor: appColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: new Text(
                          data1[index].title!,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,),
                        ),
                        value: data1[index].isCheck!,
                        onChanged: (bool? val) {})
                  ],
                );
              }),
        ),
      ],
    );
  }

  List<CheckBoxListTileModel> getData() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(title: "\u{20B9} 500 - 1000", isCheck: true),
      CheckBoxListTileModel(title: "\u{20B9} 1500 - 2000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 2500 - 3000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 3500 - 4000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 4500 - 5000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 5500 - 6000", isCheck: false),
    ];
  }
}
