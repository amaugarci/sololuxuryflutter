import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'First Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              nameTextField(),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              surNameTextField(),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date of Birth',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              dobTextField(context),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Marriage Anniversary',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              marriageAnniversaryTextField(),
              const SizedBox(height: 11),
              Row(
                children: [
                  // GetBuilder(builder: (context) {
                  //   return Checkbox(
                  //     value: registrationCtr.newsLetter,
                  //     onChanged: (value) {
                  //       registrationCtr.updateNewsLetter();
                  //     },
                  //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //   );
                  // }),
                  const Text(
                    'Sign Up for Newsletter',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 11),
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
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
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
                    ],
                  )),
                  const SizedBox(width: 11),
                  Expanded(
                      child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(
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
              const SizedBox(height: 25),
              createAnAccountButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: "First Name",
    );
  }

  Widget surNameTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: "Sur Name",
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
      controller: null,
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
      controller: null,
      hintText: "Password",
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
      controller: null,
      hintText: "Confirm Password",
      // keyboardType: TextInputType.emailAddress,
      // cursorColor: appColor,
      // decoration: decoration('Confirm Password'),
      // onChanged: (value) {
      //   registrationCtr.updateConfirmPassword(value);
      // },
    );
  }

  Widget dobTextField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showCalendar(context);
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: appColor, width: 1.15),
        ),
      ),
    );
  }

  Widget marriageAnniversaryTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: "Marriage Anniversary",
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
