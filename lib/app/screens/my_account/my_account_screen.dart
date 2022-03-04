import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import 'my_account_controller.dart';

class MyAccountPage extends GetView<MyAccountController> {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldKey.value,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appColor,
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 60),
            child: myAccountHeader(),
          ),
          iconTheme: IconThemeData(color: appColor),
        ),
        backgroundColor: backGroundColor,
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Column(
                      children: [
                        Text(
                          LanguageConstant.accessYourAccountDetailsText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 50,
                                width: Get.width * .4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(width: 2, color: appColor),
                                ),
                                child: Center(
                                    child: Text(
                                      LanguageConstant.signUpText.tr,
                                      style: TextStyle(
                                          color: appColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ))),
                            Container(
                                height: 50,
                                width: Get.width * .4,
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(width: 2, color: appColor),
                                ),
                                child: Center(
                                    child: Text(
                                      LanguageConstant.loginText.tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.myOrdersText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.myWishlistText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.addressBookText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.accountInformationText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.myTicketsText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.trackOrderText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          LanguageConstant.companyMyAccountText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.contactUsText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.secureShoppingText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.advancedSearchText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.testimonialsText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          LanguageConstant.socialMyAccountText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.hopeText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.affiliateProgramText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.influencerRegistrationText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.exchangeText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          LanguageConstant.contactMyAccountText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.privacyPolicyText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.termsConditionsText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.shippingText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          LanguageConstant.aboutText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.aboutUsMyAccountText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.referFriendMyAccountText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.returnsText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        LanguageConstant.faqMyAccountText.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }

  Widget myAccountHeader() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              LanguageConstant.myAccountText.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            Image.asset(AppAsset.bag, color: Colors.white, width: 25, height: 25,),
          ],
        ),
      ),
    );
  }
}
