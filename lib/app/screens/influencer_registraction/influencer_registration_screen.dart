import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/influencer_registraction/influencer_registration_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../components/common_widget/common_button.dart';
import '../../components/common_widget/common_text_poppins.dart';
import 'influencer_binding.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  const InfluencerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
          child: Container(
            child: influencerDesign(context),
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              color: appColorAccent,
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.35),
                  blurRadius: 9,
                  // offset: Offset(0, 9),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  headerTextStyle() {
    return const TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: appColor,
      decorationThickness: 1.5,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: appColorPrimary,
    );
  }

  subTextStyle() {
    return const TextStyle(
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: blackColor,
    );
  }

  Widget textFormField(
      {var hintText,
      var height,
      var bottomPadding,
      var topPadding,
      var controller}) {
    return Container(
      child: TextField(
        controller: controller,
        cursorColor: brownColorCEAE9F,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
              bottom: bottomPadding ?? 10, left: 12, top: topPadding ?? 0),
          hintText: hintText,
          hintStyle: subTextStyle(),
        ),
      ),
      alignment: Alignment.center,
      height: height ?? 39,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: brownColorCEAE9F,
          width: 1,
        ),
      ),
    );
  }

  Widget influencerDesign(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text(
                "Profile",
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "Mr.",
                      style: subTextStyle(),
                    ),
                    alignment: Alignment.center,
                    height: 39,
                    width: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: brownColorCEAE9F,
                        width: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "First name",
                      controller: controller.firstName,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              textFormField(
                hintText: "Last Name",
                controller: controller.lastName,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Email",
                      controller: controller.email,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Contact no.",
                      controller: controller.contactNo,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Website URL",
                      controller: controller.websiteUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "City",
                      controller: controller.city,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Country",
                      controller: controller.country,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Post Code",
                      controller: controller.postCode,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Social links",
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Facebook",
                      controller: controller.faceBook,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Instagram",
                      controller: controller.instagram,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Twitter",
                      controller: controller.twitter,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Youtube",
                      controller: controller.youtube,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Linkendin",
                      controller: controller.linkedin,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Pinterest",
                      controller: controller.pinterest,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Followers",
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Facebook",
                      controller: controller.faceBookFollower,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Instagram",
                      controller: controller.instagramFollower,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Twitter",
                      controller: controller.twitterFollower,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Youtube",
                      controller: controller.youtubeFollower,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: "Linkendin",
                      controller: controller.linkedinFollower,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: "Pinterest",
                      controller: controller.pinterestFollower,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              textFormField(
                bottomPadding: 50.0,
                topPadding: 10.0,
                height: 79.0,
                hintText: "Projects worked on",
                controller: controller.projectWork,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 120.0,
                child: CommonButton(
                  padding: EdgeInsets.zero,
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.influencerReg(
                        firstNameVal: controller.firstName,
                        websiteUrlVal: controller.websiteUrl,
                        facebookFollowerVal: controller.faceBookFollower,
                        countryVal: controller.country,
                        cityVal: controller.city,
                        contactVal: controller.contactNo,
                        lastNameVal: controller.lastName,
                        emailVal: controller.email,
                        facebookVal: controller.faceBook,
                        instagramFollowerVal: controller.instagramFollower,
                        instagramVal: controller.instagram,
                        linkedinFollowerVal: controller.linkedinFollower,
                        linkedinVal: controller.linkedin,
                        pinterestFollowerVal: controller.pinterestFollower,
                        pinterestVal: controller.pinterest,
                        postCodeVal: controller.postCode,
                        twitterFollowerVal: controller.twitterFollower,
                        twitterVal: controller.twitter,
                        youtubeFollowerVal: controller.youtubeFollower,
                        youtubeVal: controller.youtube,
                      );
                    }
                  },
                  elevation: 0.0,
                  color: appColorButton,
                  borderRadius: 0.0,
                  child: CommonTextPoppins(
                    "Let's Go",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
