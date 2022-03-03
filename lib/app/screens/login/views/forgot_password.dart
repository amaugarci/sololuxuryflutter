import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/behaviour.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/screens/login/controller/forgot_password_controller.dart';

import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  controller.screenTitle.value,
                  style: const TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  LanguageConstant.forgotYourPasswordDescriptionText.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                forgotPasswordTextField(),
                const SizedBox(height: 20),
                resetPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    ));
  }


  Widget forgotPasswordTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstant.enterYourEmailText.tr,
    );
  }

  Widget resetPasswordButton(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstant.resetMyPasswordText.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }

}