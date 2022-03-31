import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/screens/influencer_registraction/influencer_registration_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/validator.dart';
import '../../components/common_widget/common_button.dart';
import '../../components/common_widget/common_text_poppins.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  const InfluencerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: commonAppbar(title: LanguageConstant.influencerRegistrationText.tr),
        backgroundColor: appColorAccent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical:30),
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
      var validation,
      var bottomPadding,
      var topPadding,
      TextEditingController? controller}) {
    return Container(
      child: TextFormField(
        controller: controller,
        validator: validation,
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
          key: controller.formKey.value,
          child: Column(
            children: [
              Text(
                LanguageConstant.profile.tr,
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      LanguageConstant.mr.tr,
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
                      hintText: LanguageConstant.firstNameText.tr,
                      controller: controller.firstName.value,
                      validation: (value) => Validators.validateRequired(
                          value!.trim(), "First Name"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              textFormField(
                hintText: LanguageConstant.lastNameText.tr,
                controller: controller.lastName.value,
                validation: (value) =>
                    Validators.validateRequired(value!.trim(), "Last Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.emailText.tr,
                      controller: controller.email.value,
                      validation: (value) => Validators.validateEmail(
                        value!.trim(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.contactNoText.tr,
                      controller: controller.contactNo.value,
                      validation: (value) => Validators.validateMobile(
                        value!.trim(),
                      ),
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
                      hintText: LanguageConstant.websiteUrlText.tr,
                      controller: controller.websiteUrl.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.cityText.tr,
                      controller: controller.city.value,
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
                      hintText: LanguageConstant.countryText.tr,
                      controller: controller.country.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.postCodeText.tr,
                      controller: controller.postCode.value,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LanguageConstant.socialLinksText.tr,
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.facebookText.tr,
                      controller: controller.faceBook.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.instagramText.tr,
                      controller: controller.instagram.value,
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
                      hintText: LanguageConstant.twitterText.tr,
                      controller: controller.twitter.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.youtubeText.tr,
                      controller: controller.youtube.value,
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
                      hintText: LanguageConstant.linkendinText.tr,
                      controller: controller.linkedin.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.pinterestText.tr,
                      controller: controller.pinterest.value,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LanguageConstant.followersText.tr,
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.facebookText.tr,
                      controller: controller.faceBookFollower.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.instagramText.tr,
                      controller: controller.instagramFollower.value,
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
                      hintText: LanguageConstant.twitterText.tr,
                      controller: controller.twitterFollower.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.youtubeText.tr,
                      controller: controller.youtubeFollower.value,
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
                      hintText: LanguageConstant.linkendinText.tr,
                      controller: controller.linkedinFollower.value,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: textFormField(
                      hintText: LanguageConstant.pinterestText.tr,
                      controller: controller.pinterestFollower.value,
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
                hintText: LanguageConstant.workedOnText.tr,
                controller: controller.projectWork.value,
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
                  onPressed: () {
                    controller.influencerReg(context, controller.formKey.value);
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
