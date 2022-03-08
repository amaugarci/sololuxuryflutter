import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'guest_returns_controller.dart';

class GuestReturns extends GetView<GuestReturnsController> {
  const GuestReturns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuestReturnsController());

    return Scaffold(
      key: controller.scaffoldKey.value,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LanguageConstant.checkYourOrderText.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: appColor,
                      fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 14.0),
            Text(
              LanguageConstant.enterYourOrderText.tr,
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.only(bottom: 10, top: 10, left: 100),
                hintText: "Order reference",
                labelStyle: TextStyle(color: Colors.black26),
                errorStyle: TextStyle(color: Colors.black26),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: appColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: appColor,
                    width: 1.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            RichText(
              text: TextSpan(
                  text: "${LanguageConstant.howDoIFindText.tr} ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "${LanguageConstant.orderRefernceText.tr}",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ))
                  ]),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(LanguageConstant.submitText.tr),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: appColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
