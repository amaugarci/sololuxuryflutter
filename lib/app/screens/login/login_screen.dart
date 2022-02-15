import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/login/forgot_password.dart';
import 'package:solo_luxury/app/screens/login/register_screen.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 65),
              Text(
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
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              emailTextField(),
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
              passwordTextField(),
              const SizedBox(height: 22),
              signInButton(),
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
              createAnAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailTextField() {
    return EmailWidget(
      controller: null,
    );
  }

  Widget passwordTextField() {
    return PasswordWidget(
      controller: null,
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

  Widget signInButton() {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          Get.to(HomeScreen());
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text('Sign In'),
      ),
    );
  }

  Widget newCustomerButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'New Customers',
        style: TextStyle(
            color: appColor, fontWeight: FontWeight.w600, fontSize: 15.8),
      ),
    );
  }

  Widget createAnAccountButton() {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => RegisterScreen());
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          'Create An Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }
}
