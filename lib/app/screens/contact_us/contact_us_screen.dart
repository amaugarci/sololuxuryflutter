import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/input_text_field_widget.dart';
import 'package:solo_luxury/app/screens/contact_us/contact_us_controller.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/country_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/country_api_repository.dart';

import '../../../data/model/country/store_websites_model.dart';
import '../../../utils/lang_directory/language_constant.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  ContactUsScreen({Key? key}) : super(key: key);

  final CountryController countryController = Get.put(CountryController(
      countryAPIRepository: Get.put(
          CountryAPIRepository(countryAPIProvider: CountryAPIProvider()))));

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
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
                  Text(
                    LanguageConstant.contactUsText.tr,
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
                  Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: nameTextField()),
                  const SizedBox(height: 12),
                  Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: surNameTextField()),
                  const SizedBox(height: 12),
                  Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: emailTextField()),
                  const SizedBox(height: 12),
                  Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: emailConfirmationTextField()),
                  const SizedBox(height: 12),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: appColorAccent,
                      border: Border.all(
                        color: appColor,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: appColorFDF3F1,
                        icon: const Icon(Icons.expand_more_outlined,
                            color: appColor),
                        value: controller.chosenValue.value,
                        elevation: 2,
                        items: controller.data
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          LanguageConstant.typeOfEnquiryText.tr,
                        ),
                        onChanged: (String? value) {
                          controller.chosenValue.value = value!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: subjectTextField()),
                  const SizedBox(height: 12),
                  Container(
                      //height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appColorAccent,
                        border: Border.all(
                          color: appColor,
                          width: 1,
                        ),
                      ),
                      child: whatsOnYourMindTextField()),
                  const SizedBox(height: 12),

                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: appColorAccent,
                      border: Border.all(
                        color: appColor,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        dropdownColor: appColorFDF3F1,
                        icon: const Icon(Icons.expand_more_outlined,
                            color: appColor),
                        value: controller.chosenCountry.value,
                        elevation: 2,
                        items: countryController.storeWebsitesList.value
                            .map((item) {
                          StoreWebSitesModel item1 =
                              StoreWebSitesModel.fromJson(item);
                          return new DropdownMenuItem(
                              child: new Text(
                                item1.name ??
                                    '', //Names that the api dropdown contains
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              value: item1.name
                                  .toString() //Id that has to be passed that the dropdown has.....
                              //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                              );
                        }).toList(),
                        hint: Text(LanguageConstant.countryText.tr),
                        onChanged: (String? value) {
                          controller.chosenCountry.value = value!;
                        },
                      ),
                    ),
                  ),
                  //countryTextField(),
                  const SizedBox(height: 20),
                  submitAccountButton(context),
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
        ));
  }

  Widget nameTextField() {
    return TextFormFieldWidget(
      controller: controller.nameController.value,
      hintText: LanguageConstant.firstNameText.tr,
    );
  }

  Widget surNameTextField() {
    return TextFormFieldWidget(
      controller: controller.surnameController.value,
      hintText: LanguageConstant.surNameText.tr,
    );
  }

  Widget emailTextField() {
    return EmailWidget(
      controller: controller.emailController.value,
      hintText: LanguageConstant.emailText.tr,
    );
  }

  Widget emailConfirmationTextField() {
    return EmailWidget(
      controller: controller.confirmEmailController.value,
      hintText: LanguageConstant.confirmEmailText.tr,
    );
  }

  Widget subjectTextField() {
    return TextFormFieldWidget(
      controller: controller.subjectController.value,
      hintText: LanguageConstant.subjectText.tr,
    );
  }

  Widget whatsOnYourMindTextField() {
    return TextFormFieldWidget(
      controller: controller.onyourmindController.value,
      maxLines: 5,
      hintText: LanguageConstant.whatsonyourmindText.tr,
    );
  }

  Widget submitAccountButton(context) {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          controller.contactUsPost(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstant.submitText.tr,
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
