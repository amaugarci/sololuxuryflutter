import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'select_country_controller.dart';

class SelectCountryScreen extends GetView<SelectCountryController> {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectCountryController());

    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              controller.scaffoldKey.value.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(ImageConstant.menuIcon),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.searchIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.heartIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                    color: Colors.black),
              ),
            ),
          ],
          title: Image.asset(AppAsset.logo, width: 110),
          /*bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),*/
        ),
        drawer: const Drawer(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose your country",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(
                  height: 40,
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.only(bottom: 10, top: 10, left: 20),
                      hintText: "Find Country...",
                      hintStyle: TextStyle(color: appColor.withOpacity(0.4)),
                      labelStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide: BorderSide(
                          color: appColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide: BorderSide(
                          color: appColor,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: appColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            ImageConstant.searchIcon,
                            color: Colors.white,
                            height: 14,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appColor,
                        ),
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: RawScrollbar(
                    thumbColor: appColor,
                    radius: Radius.circular(20),
                    thickness: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: appColor,
                              height: 0,
                              thickness: 1.2,
                            );
                          },
                          itemCount: controller.countryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final countryList = controller.countryList[index];
                            return ListTileTheme(
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              horizontalTitleGap: 0.0,
                              minLeadingWidth: 0,
                              child: ExpansionTile(
                                childrenPadding: EdgeInsets.zero,
                                tilePadding: EdgeInsets.zero,
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: appColor,
                                      size: 32,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${countryList['countryName']}'
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  height: 2,
                                  width: 2,
                                ),
                                children: [
                                  Column(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              countryList['insideList'].length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final countryInsideList =
                                                countryList['insideList']
                                                    [index];
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF0DDD5),
                                                  border: Border(
                                                    top: BorderSide(
                                                        width: 1.2,
                                                        color: appColor),
                                                  )),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: appColor,
                                                    size: 32,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      "${countryInsideList['InsideCoutryName']}")
                                                ],
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
