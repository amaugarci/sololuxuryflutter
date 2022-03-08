import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../utils/app_asset.dart';
import '../home/widget/header_widget.dart';
import 'my_account_controller.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  const MyAccountMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: controller.scaffoldKey.value,
      endDrawer: Icon(Icons.ac_unit),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: Image.asset(AppAsset.logo, width: 110),
        bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: appColor),
      ),
      backgroundColor: backGroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor),),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true, dropdownColor: offWhite,
                    value: controller.chosenValue.value,
                    // elevation: 0,
                    style: TextStyle(
                        color: appColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    items: <String>[
                      'My Account',
                      'My Orders',
                      'My Wish List',
                      'Address Book',
                      'Account Information',
                      'My Tickets',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      'My Account',
                      style: TextStyle(
                          color: appColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String? value) {
                      controller.chosenValue.value = value!;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("Account Information",
                    style: TextStyle(color: appColor, fontSize: 18)),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("CONTACT INFORMATION",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(color: appColor,),
                    SizedBox(height: 10),
                    Text("Yogesh Kumar Sharma",
                        style: TextStyle(color: silver, fontSize: 12)),
                    Text("admin@gmail.com",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: secondaryColor),
                        child: Text("EDIT | CHANGE PASSWORD",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("NEWSLETTERS",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(color: appColor,),
                    SizedBox(height: 10),
                    Text("You Aren;t Subscribed To\nOur Newsletter.",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: secondaryColor),
                        child: Text("EDIT",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address Book ",
                        style: TextStyle(color: appColor, fontSize: 18)),
                    Text("Manage Addresses",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("DEFAULT BILLING ADDRESS",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(color: appColor,),
                    SizedBox(height: 10),
                    Text(
                        "12345\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: secondaryColor),
                        child: Text("EDIT ADDRESS",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("DEFAULT SHIPPING ADDRESS",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(color: appColor,),
                    SizedBox(height: 10),
                    Text(
                        "12345\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: secondaryColor),
                        child: Text("EDIT ADDRESS",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
