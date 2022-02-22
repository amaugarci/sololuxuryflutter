import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.5),
          child: Column(
            children: [
              const Text(
                'Contact Us',
                style: TextStyle(
                  color: appColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Whatever Your Query. Use The Contact Form\nBelow To Get In Touch-OurTeam\nIs Ready To Help 24*7',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.5,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              nameTextField(),
              const SizedBox(height: 12),
              surNameTextField(),
              const SizedBox(height: 12),
              emailTextField(),
              const SizedBox(height: 12),
              emailConfirmationTextField(),
              const SizedBox(height: 12),
              typeOfEnquiryTextField(),
              const SizedBox(height: 12),
              subjectTextField(),
              const SizedBox(height: 12),
              whatsOnYourMindTextField(),
              const SizedBox(height: 12),
              countryTextField(),
              const SizedBox(height: 20),
              submitAccountButton(),
              const SizedBox(height: 30),
              Text(
                'Head Office',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'SOLO LUXURY, O LABELS LTD,',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '20-22 WENLOCK ROAD, LONDON, N1 7GU',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'customercare@sololuxury.com',
                style: TextStyle(
                  color: appColor,
                  decoration: TextDecoration.underline,
                  fontSize: 12.5,
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
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
    hintText: "Sur name",
  );
}

Widget emailTextField() {
  return EmailWidget(
    controller: null,
    hintText: "Email",
  );
}

Widget emailConfirmationTextField() {
  return EmailWidget(
    controller: null,
  );
}

Widget typeOfEnquiryTextField() {
  return TextFormFieldWidget(
    controller: null,
    hintText: "Type your inquiry",
  );
}

Widget subjectTextField() {
  return TextFormFieldWidget(
    controller: null,
    hintText: "Subject",
  );
}

Widget whatsOnYourMindTextField() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: appColor),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      maxLines: 4,
      cursorColor: appColor,
      decoration: const InputDecoration(
        hintText: 'What\'s On Your Mind?',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 14),
      ),
    ),
  );
}

Widget countryTextField() {
  return TextFormFieldWidget(
    controller: null,
    hintText: "Country",
  );
}

Widget submitAccountButton() {
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
        'SUBMIT',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13.5,
        ),
      ),
    ),
  );
}
