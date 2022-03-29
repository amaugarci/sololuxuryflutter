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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 110),
                    Text(
                      controller.screenTitle.value,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: appColor,
                        decorationThickness: 1.5,
                        color: appColor,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      LanguageConstant.forgotYourPasswordDescriptionText.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Open Sans",
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    forgotPasswordTextField(),
                    const SizedBox(height: 30),
                    resetPasswordButton(context),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: appColor,
                          size: 15,
                        ),
                        const SizedBox(width: 1),
                        Text(
                          LanguageConstant.backText.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: appColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Open Sans",
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget forgotPasswordTextField() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: appColor, width: 1),
      ),
      child: TextFormField(
        controller: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: LanguageConstant.enterYourEmailText.tr,
        ),
      ),
    );
  }

  Widget resetPasswordButton(BuildContext context) {
    return SizedBox(
      width: 209,
      height: 40,
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
          LanguageConstant.resetMyPasswordText.tr.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
            fontFamily: "Open Sans",
          ),
        ),
      ),
    );
  }
}
