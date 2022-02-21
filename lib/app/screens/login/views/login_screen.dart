import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/behaviour.dart';
import 'package:solo_luxury/app/components/buttons/text_button.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/screens/login/views/forgot_password.dart';
import 'package:solo_luxury/app/screens/login/views/signup_screen.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/app/screens/login/controller/login_controller.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'package:solo_luxury/utils/validator.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: backGroundColor,
      body: Form(
        key: controller.formKey.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 65),
                    Text(
                      LanguageConstant.registeredCustomersText.tr,
                      style: const TextStyle(
                        color: appColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      LanguageConstant.registeredCustomersDescriptionText.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12.5,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LanguageConstant.usernameText.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.5),
                    TextFormFieldWidget(
                      controller: controller.emailController.value,
                      validator: (value) =>
                          Validators.validateRequired(value!.trim(), "Username"),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LanguageConstant.passwordText.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.5),
                    PasswordWidget(
                      controller: controller.passwordController.value,
                    ),
                    const SizedBox(height: 22),
                    PrimaryTextButton(
                      onPressed: () {
                        controller.loginUser(context :context);
                      },
                      title: LanguageConstant.signInText.tr,
                    ),
                    const SizedBox(height: 8),
                    forgotPasswordButton(),
                    const SizedBox(height: 8),
                    newCustomerButton(),
                    const SizedBox(height: 20),
                    Text(
                      LanguageConstant.loginDescriptionText.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12.5,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryTextButton(
                      onPressed: () {
                        Get.toNamed(RoutesConstants.signUpScreen);
                      },
                      title: LanguageConstant.createAccountText.tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }


  Widget forgotPasswordButton() {
    return TextButton(
      onPressed: () {
        Get.toNamed(RoutesConstants.forgotPasswordScreen);
      },
      child: Text(
        LanguageConstant.forgotYourPasswordText.tr,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget newCustomerButton() {
    return TextButton(
      onPressed: () {},
      child:  Text(
        LanguageConstant.newCustomersText.tr,
        style: const TextStyle(
            color: appColor, fontWeight: FontWeight.w600, fontSize: 15.8),
      ),
    );
  }

}
