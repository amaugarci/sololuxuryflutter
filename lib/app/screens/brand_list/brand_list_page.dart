import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import '../home/widget/header_widget.dart';
import 'brand_controller.dart';

class BrandListPage extends GetView<BrandController> {
  const BrandListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Image.asset(AppAsset.logo, width: 110),
            bottom: PreferredSize(
              preferredSize: Size(Get.width, 60),
              child: const HeaderWidget(),
            ),
          ),
          endDrawer: const Drawer(),
          body: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: secondaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Find Brands",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Icon(
                        Icons.search,
                        color: appColor,
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: backGroundColor),
                  child: Expanded(
                    child: Text(
                        "A  B  C  D  E  F  G  H  I  J  K  L  M  \nN  O  P  Q  R  S  T  U  V  W  X  Y  Z  \n1  2  3  4  5  6  7  8  9",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  )),
              Expanded(
                child: ListView(
                  children: [
                    // for (var entry in groupedLists.entries)
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(color: offWhite),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 90,
                        child: ListView.builder(
                          //   physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            if (index == 4) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child:
                                        Text(controller.brandList[index].name),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(controller.brandList[index].name),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Brand {
  String name;

  Brand({required this.name});
}
