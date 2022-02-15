import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class ReferFriendScreen extends StatelessWidget {
  const ReferFriendScreen({Key? key}) : super(key: key);

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
              Text(
                'REFER A FRIEND',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter Details Below To Send A 10% Coupon Code\n To Your Friend',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12.5,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormFieldWidget(
      hintText: "First Name",
      controller: null,
    );
  }

  Widget emailTextField() {
    return TextFormFieldWidget(
      hintText: "Last Name",
      controller: null,
    );
  }

  Widget phoneTextField() {
    return NumberWidget(
      keyboardType: TextInputType.number,
      controller: null,
      hintText: "Phone Number",
    );
  }

  Widget friendFirstNameTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: "Friend First Name",
    );
  }

  Widget friendEmailTextField() {
    return EmailWidget(
      controller: null,
      keyboardType: TextInputType.emailAddress,
      hintText: "Friend Email Address",
    );
  }

  Widget friendPhoneTextField() {
    return NumberWidget(
      keyboardType: TextInputType.emailAddress,
      controller: null,
      hintText: "Friend Phone Number",
    );
  }

  Widget registerButton() {
    return SizedBox(
      width: 160,
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
          'Register',
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
