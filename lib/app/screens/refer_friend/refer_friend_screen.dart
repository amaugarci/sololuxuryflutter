import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/app_routes.dart';
import '../../components/common_widget/common_appbar.dart';
import '../../components/common_widget/common_text_field_open_sans.dart';
import '../../components/common_widget/common_text_opensans.dart';
import '../../utils/app_asset.dart';

class ReferFriendScreen extends GetView<ReferFriendController> {
  const ReferFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(title: LanguageConstant.contactUsText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Obx(() => controller.isSuccessfully.value
              ? successfully()
              : Column(
                  children: [
                    widgetThanks(),
                    const SizedBox(height: 25),
                    CommonTextOpenSans(
                      'REFER A FRIEND',
                      color: appColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CommonTextOpenSans(
                        'Enter Details Below To Send A 10% Coupon Code To Your Friend',
                        textAlign: TextAlign.center,
                        color: Colors.black87,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    nameTextField(),
                    const SizedBox(height: 12),
                    emailTextField(),
                    const SizedBox(height: 12),
                    phoneTextField(),
                    const SizedBox(height: 12),
                    friendFirstNameTextField(),
                    const SizedBox(height: 12),
                    friendEmailTextField(),
                    const SizedBox(height: 12),
                    friendPhoneTextField(),
                    const SizedBox(height: 25),
                    registerButton(),
                    const SizedBox(height: 25),
                  ],
                )),
        ),
      ),
    );
  }

  Widget widgetThanks() {
    return Container(
      width: Get.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 50.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(border: Border.all(color: appColorButton)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAsset.check,
            height: 16.0,
            width: 16.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          CommonTextOpenSans(
            "Thank You! You and Your friend  Will receive an email with the details",
            color: appColorButton,
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget nameTextField() {
    return CommonTextFieldOpenSans(
      hintText: "First Name",
      controller: controller.yourFirstNameController,
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      borderColor: appColorButton,
      textColor: appColorButton,
    );
  }

  Widget emailTextField() {
    return CommonTextFieldOpenSans(
      hintText: "Email Address",
      controller: controller.yourEmailController,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      borderColor: appColorButton,
      textColor: appColorButton,
    );
  }

  Widget phoneTextField() {
    return CommonTextFieldOpenSans(
      keyboardType: TextInputType.number,
      controller: controller.yourPhoneController,
      hintText: "Phone Number",
      textAlign: TextAlign.center,
      borderColor: appColorButton,
      textColor: appColorButton,
    );
  }

  Widget friendFirstNameTextField() {
    return CommonTextFieldOpenSans(
      controller: controller.refFirstNameController,
      hintText: "Friend First Name",
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      borderColor: appColorButton,
      textColor: appColorButton,
    );
  }

  Widget friendEmailTextField() {
    return CommonTextFieldOpenSans(
      controller: controller.refEmailController,
      keyboardType: TextInputType.emailAddress,
      hintText: "Friend Email Address",
      textAlign: TextAlign.center,
      borderColor: appColorButton,
      textColor: appColorButton,
    );
  }

  Widget friendPhoneTextField() {
    return CommonTextFieldOpenSans(
      keyboardType: TextInputType.phone,
      controller: controller.refPhoneController,
      hintText: "Friend Phone Number",
      textAlign: TextAlign.center,
      borderColor: appColorButton,
      textColor: appColorButton,
    );
  }

  Widget registerButton() {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          controller.postData();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: CommonTextOpenSans(
          'Register',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13.5,
        ),
      ),
    );
  }

  Widget successfully() {
    return Obx(() => Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextOpenSans(
                controller.responseMsg.value,
                textAlign: TextAlign.center,
                fontSize: 14.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  width: 160,
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(Get.context!).requestFocus(FocusNode());
                      Get.offAndToNamed(RoutesConstants.dashboardScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      primary: appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: CommonTextOpenSans(
                      'Continue Shopping',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ))
            ],
          ),
        ));
  }
}
