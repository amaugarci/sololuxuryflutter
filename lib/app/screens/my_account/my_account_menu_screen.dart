import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/contact_us/contact_us_screen.dart';
import 'package:solo_luxury/app/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:solo_luxury/app/screens/privacy_policy/terms_and_condition_screen.dart';
import 'package:solo_luxury/app/screens/tickets/my_tickets_screen.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/validator.dart';
import '../../components/input_text_field_widget.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ))),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(RoutesConstants.loginScreen);
                              },
                              child: Container(
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.myOrderScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.myOrdersText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.wishlistScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.myWishlistText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.addAdressScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.addressBookText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.myAccountScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.accountInformationText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const MyTicketScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.myTicketsText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.trackOrderText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
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
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const ContactUsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.contactUsText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.secureShoppingText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.productsScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.advancedSearchText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.testimonialsText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
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
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.hopeText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.affiliateProgramScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.affiliateProgramText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.influencerRegistrationScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.influencerRegistrationText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.exchangeText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
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
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const PrivacyPolicyScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.privacyPolicyText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const TermsAndConditionScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.termsConditionsText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.shippingText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
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
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const AboutUsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.aboutUsMyAccountText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const ReferFriendScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.referFriendMyAccountText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.returnsText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesConstants.faqScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.faqMyAccountText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        showTitleDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          LanguageConstant.liveChatText.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
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
            Image.asset(
              AppAsset.bag,
              color: Colors.white,
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

  Widget nameTextField() {
    return TextFormFieldWidget(
      controller: controller.firstNameController.value,
      hintText: '',
      validator: (value) => Validators.validateRequired(value!.trim(), "Name"),
    );
  }

  Widget emailTextField() {
    return EmailWidget(
        controller: controller.emailController.value,
        validator: (value) => Validators.validateEmail(
              value!.trim(),
            ));
  }
}
