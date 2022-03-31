import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/contact_us/contact_us_screen.dart';
import 'package:solo_luxury/app/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:solo_luxury/app/screens/privacy_policy/terms_and_condition_screen.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_screen.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/validator.dart';
import '../../components/input_text_field_widget.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import '../country/country_screen.dart';
import '../my_tickets/my_tickets_screen.dart';
import '../refer_friend/refer_friend_screen.dart';
import 'my_account_controller.dart';
import 'package:livechatt/livechatt.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  const MyAccountMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldKey.value,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: secondaryColor,
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 60),
            child: myAccountHeader(),
          ),
          iconTheme: IconThemeData(color: appColor),
        ),
        backgroundColor: backGroundColor,
        body: Container(
          //padding: EdgeInsets.only(left: 10, right: 10),
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
                              color: appColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesConstants.signUpScreen);
                              },
                              child: Container(
                                  height: 50,
                                  width: Get.width * .4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border:
                                        Border.all(width: 2, color: appColor),
                                  ),
                                  child: Center(
                                      child: Text(
                                    LanguageConstant.signUpText.tr,
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ))),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesConstants.loginScreen);
                              },
                              child: Container(
                                  height: 50,
                                  width: Get.width * .4,
                                  decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(14),
                                    border:
                                        Border.all(width: 2, color: appColor),
                                  ),
                                  child: Center(
                                      child: Text(
                                    LanguageConstant.loginText.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.myOrderScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.myOrdersText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.wishlistScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.myWishlistText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutesConstants.addressBookScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.addressBookText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.myAccountScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.accountInformationText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.myTicketsScreen);
                                  // Get.to(() => const MyTicketScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.myTicketsText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.trackOrderText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.countryScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    controller.countryCurrency.value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                        Container(
                          color: secondaryColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: Text(
                                LanguageConstant.companyMyAccountText.tr,
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.contactUsScreen);
                                  //Get.to(() => const ContactUsScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.contactUsText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.appSecureShoppingScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.secureShoppingText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.productsScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.advancedSearchText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.testimonialsText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: secondaryColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: Text(
                                LanguageConstant.socialMyAccountText.tr,
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.charityScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.hopeText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutesConstants.affiliateProgramScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.affiliateProgramText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants
                                      .influencerRegistrationScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant
                                        .influencerRegistrationText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.exchangeText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: secondaryColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: Text(
                                LanguageConstant.contactMyAccountText.tr,
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const PrivacyPolicyScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.privacyPolicyText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const TermsAndConditionScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.termsConditionsText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.shippingText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: secondaryColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: Text(
                                LanguageConstant.aboutText.tr,
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const AboutUsScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.aboutUsMyAccountText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutesConstants.referFriendScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant
                                        .referFriendMyAccountText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  // Get.toNamed(RoutesConstants.guestReturnsScreen);
                                  Get.toNamed(
                                      RoutesConstants.returnsAndRefundsScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.returnsText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.faqScreen);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.faqMyAccountText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  showTitleDialog1(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    LanguageConstant.liveChatText.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
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
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            Image.asset(
              AppAsset.bag,
              color: Colors.black,
              width: 25,
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Future showTitleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Form(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LanguageConstant.firstNameText.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  nameTextField(),
                  const SizedBox(height: 7.5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LanguageConstant.emailText.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  emailTextField(),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Livechat.beginChat(
                      AppConstants.licenceId,
                      '1',
                      controller.firstNameController.value.text.trim(),
                      controller.emailController.value.text.trim());
                },
                child: Text(LanguageConstant.startChatText.tr),
              ),
            ],
          );
        });
  }

  Future showTitleDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: backGroundColor,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.all(10),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: -45.0,
                  child: CircleAvatar(
                    radius: 45,
                    child: Image.asset(
                      AppAsset.account,
                      color: Colors.white,
                      width: 40,
                      height: 40,
                    ),
                    backgroundColor: appColor,
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 70,
                        margin: EdgeInsets.only(top: 60),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                    LanguageConstant.welcometoChatText.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(LanguageConstant.fillTheFormText.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400))),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: appColorAccent,
                                  border: Border.all(
                                    color: appColor,
                                    width: 1,
                                  ),
                                ),
                                child: nameTextField()),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: appColorAccent,
                                  border: Border.all(
                                    color: appColor,
                                    width: 1,
                                  ),
                                ),
                                child: emailTextField()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: startChatButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget nameTextField() {
    return TextFormFieldWidget(
      controller: controller.firstNameController.value,
      hintText: LanguageConstant.nameChatText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateRequired(value!.trim(), "Name"),
    );
  }

  Widget emailTextField() {
    return EmailWidget(
        controller: controller.emailController.value,
        hintText: LanguageConstant.emailText.tr,
        textAlign: TextAlign.center,
        validator: (value) => Validators.validateEmail(
              value!.trim(),
            ));
  }

  Widget startChatButton() {
    return SizedBox(
      width: 180,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            Livechat.beginChat(
                AppConstants.licenceId,
                '1',
                controller.firstNameController.value.text.trim(),
                controller.emailController.value.text.trim());
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
        ),
        child: Text(
          LanguageConstant.startChatText.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
