import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/login/controller/forget_password_menu_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 112),
              InkWell(
                onTap: () {
                  // controller.getForgetPasswordResponse();
                },
                child: Text(
                  LanguageConstant.forgetPassword.tr,
                  style: textStyleUtils600(),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                LanguageConstant.forgetPasswordContain.tr,
                textAlign: TextAlign.center,
                style: textStyleUtils16(),
              ),
              const SizedBox(height: 25),
              Text(
                LanguageConstant.continueShopping.tr.toUpperCase(),
                style: textStyleUtils18(),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstant.backToSignInScreen.tr.toUpperCase(),
                style: textStyleUtils18(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  textStyleUtils600() {
    return const TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: buttoncolor,
      decorationThickness: 1.5,
      color: buttoncolor,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  textStyleUtils16() {
    return const TextStyle(
      color: blackColor,
      fontFamily: "Open Sans",
      fontSize: 16,
    );
  }

  textStyleUtils18() {
    return const TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: buttoncolor,
      decorationThickness: 1.5,
      color: buttoncolor,
      fontFamily: "Open Sans",
      fontSize: 18,
    );
  }
}
