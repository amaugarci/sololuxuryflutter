import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'add_address_controller.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddAddressController());

    return Obx(() => Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                controller.scaffoldKey.value.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(ImageConstant.menuIcon),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.searchIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.heartIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                      color: Colors.black),
                ),
              ),
            ],
            title: Image.asset(AppAsset.logo, width: 110),
            /*bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),*/
          ),
          drawer: const Drawer(),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    color: Colors.white.withOpacity(0.5),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.firstNameController.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(bottom: 10, top: 10, left: 10),
                            hintText: "First Name",
                            labelStyle: TextStyle(color: Colors.black54),
                            errorStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                                width: 1.0,
                              ),
                            ),
                            isDense: true,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Container(
                                height: 10,
                                child: Image.asset(
                                  'assets/icons/user1.png',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter First Name";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.lastNameController.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(bottom: 10, top: 10, left: 10),
                            hintText: "Last Name",
                            labelStyle: TextStyle(color: Colors.black54),
                            errorStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Container(
                                height: 10,
                                child: Image.asset(
                                  'assets/icons/user1.png',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Last Name";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.phoneNumberController.value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(bottom: 10, top: 10, left: 10),
                            hintText: "Phone Number",
                            labelStyle: TextStyle(color: Colors.black54),
                            errorStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: Icon(
                              CupertinoIcons.phone_fill,
                              color: appColor.withOpacity(0.2),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Phone Number";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: appColor, width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: controller.stateList
                                  .map((value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ))
                                  .toList(),
                              isExpanded: true,
                              hint: controller.selectedState.value == ""
                                  ? Text(
                                      "State/Provine",
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  : Text(
                                      controller.selectedState.value.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 28,
                                color: appColor.withOpacity(0.2),
                              ),
                              onChanged: (String? value) {
                                controller.selectedState.value = value!;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.zipPovinceController.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(bottom: 10, top: 10, left: 10),
                            hintText: "Zip/Province",
                            labelStyle: TextStyle(color: Colors.black54),
                            errorStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Container(
                                height: 10,
                                child: Image.asset(
                                  'assets/icons/zip1.png',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Zip/Province";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.address1Controller.value,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                bottom: 10,
                                top: 10,
                                left: 10,
                              ),
                              hintText: "Street Address 1",
                              labelStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: appColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: appColor,
                                  width: 1.0,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                  height: 10,
                                  child: Image.asset(
                                    'assets/icons/envelope1.png',
                                    height: 10,
                                    width: 10,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0))),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Street Address";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.address2Controller.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(bottom: 10, top: 10, left: 10),
                            hintText: "Street Address 2",
                            labelStyle: TextStyle(color: Colors.black54),
                            errorStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: appColor,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Container(
                                height: 10,
                                child: Image.asset(
                                  'assets/icons/envelope1.png',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: appColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Street Address";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.cityController.value,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  bottom: 10, top: 10, left: 10),
                              hintText: "City",
                              labelStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: appColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: appColor,
                                  width: 1.0,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.near_me,
                                color: appColor.withOpacity(0.2),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColor,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0))),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter City";
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: appColor, width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: controller.countryList
                                  .map((value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ))
                                  .toList(),
                              isExpanded: true,
                              hint: controller.selectedCoutry.value == ""
                                  ? Text(
                                      "Country",
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  : Text(
                                      controller.selectedCoutry.value
                                          .toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 28,
                                color: appColor.withOpacity(0.2),
                              ),
                              onChanged: (String? value) {
                                controller.selectedCoutry.value = value!;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formKey.value.currentState!
                                  .validate()) {
                                controller.addAdress();
                              }
                            },
                            child: Text(
                              'Save Address'.toUpperCase(),
                              style: TextStyle(fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: appColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5), // <-- Radius
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  ExpandableNotifier(
                      child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                              expandIcon: Container(),
                              collapseIcon: Container(),
                              iconPadding: const EdgeInsets.all(0.0)),
                          header: detailsButton(
                              LanguageConstant.aboutUsText.toUpperCase(), 1),
                          controller:
                              controller.aboutUsExpandableController.value,
                          collapsed: Container(),
                          expanded: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const AboutUsScreen());
                                  },
                                  child: Text(
                                    LanguageConstant.aboutUsText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const ReferFriendScreen());
                                  },
                                  child: Text(
                                    LanguageConstant.referFriendText.tr,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {},
                                  child: Text(
                                    LanguageConstant.returnsRefundsText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    LanguageConstant.faqText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          builder: (_, collapsed, expanded) {
                            return Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
                  ExpandableNotifier(
                      child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                              expandIcon: Container(),
                              collapseIcon: Container(),
                              iconPadding: const EdgeInsets.all(0.0)),
                          header: detailsButton(
                              LanguageConstant.contactText.tr.toUpperCase(), 2),
                          collapsed: Container(),
                          expanded: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const AboutUsScreen());
                                  },
                                  child: Text(
                                    LanguageConstant.aboutUsText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const ReferFriendScreen());
                                  },
                                  child: Text(
                                    LanguageConstant.referFriendText.tr,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    LanguageConstant.returnsRefundsText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    LanguageConstant.faqText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          builder: (_, collapsed, expanded) {
                            return Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
                  ExpandableNotifier(
                      child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                              expandIcon: Container(),
                              collapseIcon: Container(),
                              iconPadding: const EdgeInsets.all(0.0)),
                          header: detailsButton(
                              LanguageConstant.socialText.tr.toUpperCase(), 3),
                          collapsed: Container(),
                          expanded: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const AboutUsScreen());
                                  },
                                  child: Text(
                                    LanguageConstant.aboutUsText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const ReferFriendScreen());
                                  },
                                  child: Text(
                                    LanguageConstant.referFriendText.tr,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    LanguageConstant.returnsRefundsText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    LanguageConstant.faqText.tr,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          builder: (_, collapsed, expanded) {
                            return Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
                  ExpandableNotifier(
                      child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                              expandIcon: Container(),
                              collapseIcon: Container(),
                              iconPadding: const EdgeInsets.all(0.0)),
                          header: detailsButton(
                              LanguageConstant.companyText.tr.toUpperCase(), 4),
                          collapsed: Container(),
                          expanded: Container(),
                          builder: (_, collapsed, expanded) {
                            return Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 20),
                  emailSubscribe(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ));
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if (value == 1) {
          controller.aboutUsExpandableController.value.toggle();
        }
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: appColor,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget emailSubscribe() {
    return Container(
      height: 47,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: appColor, width: 1.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: LanguageConstant.yourEmailText.tr,
                hintStyle: TextStyle(color: Colors.black54, fontSize: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 47,
            width: 120,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(30),
              // border: Border.all(color: appColor, width: 1.5),
            ),
            alignment: Alignment.center,
            child: const Text(
              'SUBSCRIBE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
