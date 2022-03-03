import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/filter/filter_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';

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
                      padding: EdgeInsets.all(10),
                      height: 500,
                      decoration: BoxDecoration(color: lightBrownColor),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Filters",
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.close,
                                size: 25.0,
                                color: appColor,
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
                                                        ? lightappColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text('Price',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                        ? lightappColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    'Color',
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
                                                        ? lightappColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text('Brand',
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
                                                        ? lightappColor
                                                        : lightBrownColor),
                                                width: Get.width,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text('Size',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: appColor)),
                                                )),
                                          ),
                                        ],
                                      )),
                                  Container(
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
            SizedBox(height: 100)
          ]),
        ))));
  }

  Widget priceFilterWidget() {
    return Column(
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
                  'Search..',
                  style: TextStyle(color: brownColor),
                ),
              ],
            )),
        Expanded(
            child: Container(
          child: Column(
            children: priceList
                .map((data) => RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      activeColor: appColor,
                      title: Text("${data}"),
                      groupValue: controller.priceFilter.value,
                      value: data,
                      onChanged: (val) {
                        controller.priceFilter.value = val as String;
                      },
                    ))
                .toList(),
          ),
        )),
      ],
    );
  }

  List<String> priceList = [
    "500 - 1000",
    "1500 - 2000",
    "2500 - 3000",
    "3500 - 4000",
    "4500 - 5000",
    "5500 - 6000"
  ];
}
