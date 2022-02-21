import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/buttons/text_button.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/login/forgot_password.dart';
import 'package:solo_luxury/app/screens/login/signup_screen.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/controller/login_controller.dart';
import 'package:solo_luxury/utils/validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 65),
                const Text(
                  'Registered Customers',
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'If You Have An Account, Sign In With Your\nEmail Address.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ),
                const SizedBox(height: 7.5),
                TextFormFieldWidget(
                  controller: loginController.emailController,
                  validator: (value) =>
                      Validators.validateRequired(value!.trim(), "Username"),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ),
                const SizedBox(height: 7.5),
                PasswordWidget(
                  controller: loginController.passwordController,
                ),
                const SizedBox(height: 22),
                PrimaryTextButton(
                  onPressed: () {
                    loginController.loginUser(context, formKey);
                  },
                  title: "Sign in",
                ),
                const SizedBox(height: 8),
                forgotPasswordButton(),
                const SizedBox(height: 8),
                newCustomerButton(),
                const SizedBox(height: 20),
                const Text(
                  'Creating an account has many benefits: check\nout faster, keep more than one address,\ntrack orders and more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryTextButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  title: "Create Account",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotPasswordButton() {
    return TextButton(
      onPressed: () {
        Get.to(() => const ForgotPasswordScreen());
      },
      child: const Text(
        'Forgot Your Password?',
        style: TextStyle(
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
      child: const Text(
        'New Customers',
        style: TextStyle(
            color: appColor, fontWeight: FontWeight.w600, fontSize: 15.8),
      ),
    );
  }
}
