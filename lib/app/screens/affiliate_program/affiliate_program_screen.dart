import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/behaviour.dart';
import 'package:solo_luxury/app/components/headline_body_one_base_widget.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/screens/affiliate_program/affiliate_program_controller.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'package:solo_luxury/utils/validator.dart';

import '../../components/common_widget/common_appbar.dart';

class AffiliateProgramScreen extends GetView<AffiliateProgramController> {
  const AffiliateProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: commonAppbar(title: LanguageConstant.affiliateProgramText),
          backgroundColor: controller.backColor.value,
          body: Stack(
            children: [
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                      ),
                      Center(
                        child: HeadlineBodyOneBaseWidget(
                          title: controller.screenTitle.value,
                          titleColor: Colors.black,
                          titleTextAlign: TextAlign.center,
                          underline: true,
                          fontSize: 16.0,
                        ),
                      ),
                      lookingForWidget(context: context),
                      expectForWidget(context: context),
                      promoteForWidget(context: context),
                      applyForWidget(context: context),
                      affiliatePersonForm(context: context),
                    ],
                  ),
                ),
              ),
              // appBarWidget(controller),
            ],
          ),
        ));
  }

  Widget bulletSentence({required BuildContext context, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeadlineBodyOneBaseWidget(
          title: "•",
          titleColor: Colors.black,
          titleTextAlign: TextAlign.start,
          fontSize: 14.0,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Expanded(
          child: HeadlineBodyOneBaseWidget(
            title: text,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.start,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget lookingForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstant.whoAreWeLookingTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstant.whoAreWeLookingDescriptionOneText.tr,
                  titleColor: Colors.black,
                  titleTextAlign: TextAlign.start,
                  fontSize: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget expectForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstant.whatCanYouExpectTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                bulletSentence(
                    context: context,
                    text: LanguageConstant.expectRuleOneText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.expectRuleTwoText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.expectRuleThreeText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.expectRuleFourText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.expectRuleFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget promoteForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstant.promoteSoloQuestionText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                bulletSentence(
                    context: context,
                    text: LanguageConstant.promoteSoloAnswerOneText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.promoteSoloAnswerTwoText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.promoteSoloAnswerThreeText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.promoteSoloAnswerFourText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstant.promoteSoloAnswerFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget applyForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstant.howApplyTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstant.howApplyAnswerOneText.tr,
                  titleColor: Colors.black,
                  titleTextAlign: TextAlign.start,
                  fontSize: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget affiliatePersonForm({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.formKey.value,
        child: Container(
          width: MediaQuery.of(context).size.width - 40.0,
          decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              color: controller.backColor.value,
              shadows: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 5.0,
                    spreadRadius: 3.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                profilePartWidget(context :context),
                const SizedBox(
                  height: 16.0,
                ),
                addressPartWidget(context : context),
                const SizedBox(
                  height: 20.0,
                ),
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstant.letsGoText.tr,
                  titleColor: appColor,
                  titleTextAlign: TextAlign.center,
                  underline: true,
                  fontSize: 16.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profilePartWidget({required BuildContext context}) {

    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstant.profile.tr,
          titleColor: Colors.black,
          titleTextAlign: TextAlign.center,
          underline: true,
          fontSize: 16.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                          color: affiliateBorderColor))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (String? value) {
                      controller.selectedValue.value = value.toString();
                    },
                    icon: Image.asset(AppAsset.downArrow,
                        height: 16, width: 16.0),
                    value: controller.selectedValue.value,
                    items: <String>["Mr.", "Mrs."]
                        .map(
                          (String value) => DropdownMenuItem<String>(
                        child: HeadlineBodyOneBaseWidget(
                          title: value,
                          fontSize: 14,
                        ),
                        value: value,
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormFieldWidget(
                controller: controller.firstNameController.value,
                focusNode: controller.focusNode.value,
                unFillField: true,
                hintText: LanguageConstant.firstNameText.tr,
                validator: (value) {
                  return Validators.validateName(
                      value, LanguageConstant.firstNameText.tr);
                },
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormFieldWidget(
          controller: controller.lastNameController.value,
          focusNode: controller.lastNameFocusNode.value,
          unFillField: true,
          hintText: LanguageConstant.lastNameText.tr,
          validator: (value) {
            return Validators.validateName(
                value, LanguageConstant.lastNameText.tr);
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormFieldWidget(
                controller: controller.emailController.value,
                focusNode: controller.emailFocusNode.value,
                keyboardType: TextInputType.emailAddress,
                unFillField: true,
                hintText: LanguageConstant.emailText.tr,
                validator: (value) {
                  return Validators.validateEmail(
                      value);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormFieldWidget(
                controller: controller.contactNoController.value,
                focusNode: controller.contactNoFocusNode.value,
                keyboardType: TextInputType.number,
                unFillField: true,
                hintText: LanguageConstant.contactNoText.tr,
                validator: (value) {
                  return Validators.validateMobile(
                      value!);
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFormFieldWidget(
                controller: controller.websiteController.value,
                focusNode: controller.websiteNoFocusNode.value,
                unFillField: true,
                hintText: LanguageConstant.websiteUrlText.tr,
                validator: (value) {
                  return Validators.validateName(
                      value, LanguageConstant.websiteUrlText.tr);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),

      ],
    );
  }

  Widget addressPartWidget({required BuildContext context}) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstant.addressText.tr,
          titleColor: Colors.black,
          titleTextAlign: TextAlign.center,
          underline: true,
          fontSize: 16.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                            color: affiliateBorderColor))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.selectedVisitorValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.selectedVisitorValue.value,
                      items: <String>[LanguageConstant.visitorMonthHintText.tr,"Mr.", "Mrs."]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                          child: HeadlineBodyOneBaseWidget(
                            title: value,
                            fontSize: 14,
                          ),
                          value: value,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                            color: affiliateBorderColor))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.selectedViewsValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.selectedViewsValue.value,
                      items: <String>[LanguageConstant.viewsMonthHintText.tr,"Mr.", "Mrs."]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                          child: HeadlineBodyOneBaseWidget(
                            title: value,
                            fontSize: 14,
                          ),
                          value: value,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormFieldWidget(
                controller: controller.addressOneController.value,
                focusNode: controller.addressOneFocusNode.value,
                keyboardType: TextInputType.streetAddress,
                unFillField: true,
                hintText: LanguageConstant.addressOneText.tr,
                validator: (value) {
                  return Validators.validateName(
                      value,LanguageConstant.addressOneText.tr);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormFieldWidget(
                controller: controller.addressTwoController.value,
                focusNode: controller.addressTwoFocusNode.value,
                keyboardType: TextInputType.streetAddress,
                unFillField: true,
                hintText: LanguageConstant.addressTwoText.tr,
                validator: (value) {
                  return Validators.validateName(
                      value,LanguageConstant.addressTwoText.tr);
                },
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                            color: affiliateBorderColor))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.cityValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.cityValue.value,
                      items: <String>[LanguageConstant.cityHintText.tr,"Mr.", "Mrs."]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                          child: HeadlineBodyOneBaseWidget(
                            title: value,
                            fontSize: 14,
                          ),
                          value: value,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                            color: affiliateBorderColor))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.countryValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.countryValue.value,
                      items: <String>[LanguageConstant.countryHintText.tr,"Mr.", "Mrs."]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                          child: HeadlineBodyOneBaseWidget(
                            title: value,
                            fontSize: 14,
                          ),
                          value: value,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFormFieldWidget(
                controller: controller.postCodeController.value,
                focusNode: controller.postCodeFocusNode.value,
                keyboardType: TextInputType.streetAddress,
                unFillField: true,
                hintText: LanguageConstant.postCodeText.tr,
                validator: (value) {
                  return Validators.validateName(
                      value,LanguageConstant.addressOneText.tr);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}
