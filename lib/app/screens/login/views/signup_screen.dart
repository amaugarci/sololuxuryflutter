import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/DatepickerWidget.dart';
import 'package:solo_luxury/app/components/behaviour.dart';
import 'package:solo_luxury/app/components/buttons/text_button.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/app/screens/login/controller/signup_controller.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'package:solo_luxury/utils/validator.dart';


class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Form(
        key: controller.formKey.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.5),
          child: Center(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 7.5),
                    nameTextField(),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LanguageConstant.lastNameText.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.5),
                    surNameTextField(),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LanguageConstant.dateOfBirthText.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.5),
                    DatepickerWidget(
                      enabled: true,
                      controller: controller.dateOfBirthController.value,
                      labelText: LanguageConstant.dateOfBirthText.tr,
                      validator: (date) => (date == null &&
                          controller.dateOfBirthController.value.text == '')
                          ? LanguageConstant.pleaseSelectValidDateText.tr
                          : null,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LanguageConstant.marriageAnniversaryText.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7.5),
                    marriageAnniversaryTextField(),
                    const SizedBox(height: 11),
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
                    const SizedBox(height: 7.5),
                    emailTextField(),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [
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
                                passwordTextField(),
                              ],
                            )),
                        const SizedBox(width: 11),
                        Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    LanguageConstant.confirmPasswordText.tr,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7.5),
                                confirmPasswordTextField(),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(height: 11),
                    Row(
                      children: [
                        Obx(
                              () => Switch(
                            value: controller.newsLetter.value,
                            activeColor: appColor,
                            activeTrackColor: appColor.withOpacity(0.3),
                            inactiveTrackColor: appColor.withOpacity(0.3),
                            onChanged: (value) {
                              controller.newsLetter.value =
                              !controller.newsLetter.value;
                              // loginController.isRemember.value =
                              //     !loginController.isRemember.value;
                            },
                          ),
                        ),
                        Text(
                          LanguageConstant.signUpForNewsletterText.tr,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    PrimaryTextButton(
                      title: LanguageConstant.createAccountText.tr,
                      onPressed: () {
                        controller.registerUser(context, controller.formKey.value);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget nameTextField() {
    return TextFormFieldWidget(
      controller: controller.firstNameController.value,
      hintText: LanguageConstant.firstNameText.tr,
      validator: (value) =>
          Validators.validateRequired(value!.trim(), "First Name"),
    );
  }

  Widget surNameTextField() {
    return TextFormFieldWidget(
      controller: controller.lastNameController.value,
      hintText:LanguageConstant.lastNameText.tr,
      validator: (value) =>
          Validators.validateRequired(value!.trim(), "Last Name"),
      // keyboardType: TextInputType.emailAddress,
      // cursorColor: appColor,
      // decoration: decoration('Last Name'),
      // onChanged: (value) {
      //   registrationCtr.updateLastName(value);
      // },
    );
  }

  Widget emailTextField() {
    return EmailWidget(
      controller: controller.emailController.value,
        validator: (value) =>
            Validators.validateEmail(value!.trim(),)
      // keyboardType: TextInputType.emailAddress,
      // cursorColor: appColor,
      // decoration: decoration('Email address..'),
      // onChanged: (value) {
      //   registrationCtr.updateEmail(value);
      // },
    );
  }

  Widget passwordTextField() {
    return PasswordWidget(
      controller: controller.passwordController.value,
      hintText: LanguageConstant.passwordText.tr,
        validator: (value) =>
            Validators.validatePassword(value!.trim())
      // keyboardType: TextInputType.emailAddress,
      // cursorColor: appColor,
      // decoration: decoration('Password'),
      // onChanged: (value) {
      //   registrationCtr.updatePassword(value);
      // },
    );
  }

  Widget confirmPasswordTextField() {
    return PasswordWidget(
      controller: controller.confirmPasswordController.value,
      hintText: LanguageConstant.confirmPasswordText.tr,
        validator: (value) =>
            Validators.validateConfirmPassword(value!.trim(), controller.passwordController.value.text.trim())
      // keyboardType: TextInputType.emailAddress,
      // cursorColor: appColor,
      // decoration: decoration('Confirm Password'),
      // onChanged: (value) {
      //   registrationCtr.updateConfirmPassword(value);
      // },
    );
  }

  Widget marriageAnniversaryTextField() {
    return DatepickerWidget(
      enabled: true,
      controller: controller.marriageAnniversaryController.value,
      labelText: LanguageConstant.dateOfBirthText.tr,
      validator: (date) => (date == null &&
          controller.marriageAnniversaryController.value.text == '')
          ? LanguageConstant.pleaseSelectValidDateText.tr
          : null,
    );
    return TextFormFieldWidget(
      controller: controller.marriageAnniversaryController.value,
      hintText:LanguageConstant.marriageAnniversaryText.tr,
      validator: (value) =>
          Validators.validateRequired(value!.trim(), "Marriage Anniversary"),
    );
  }

  Widget createAnAccountButton() {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          // registrationCtr.postRegistrationDetails();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // child: GetBuilder<RegistrationController>(
        //   builder: (context) {
        //     if (registrationCtr.showProgress == true) {
        //       return const SpinKitDualRing(
        //         color: Colors.white,
        //         size: 20,
        //         lineWidth: 5,
        //       );
        //     } else {
        //       return const Text(
        //         'Create An Account',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w600,
        //           fontSize: 13.5,
        //         ),
        //       );
        //     }
        //   },
        // ),

        child: Text(
          LanguageConstant.createAccountText.tr,
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

