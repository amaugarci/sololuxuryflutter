import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';

import 'package:solo_luxury/app/utils/colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                'Forgot Your Password?',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please Enter Your Email Address Below To Receive\nA Password Reset Link',
                textAlign: TextAlign.center,
                style: TextStyle(
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
    );
  }

  Widget forgotPasswordTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: "Enter your email",
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
        child: const Text(
          'Reset My Password',
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
