import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/utils/image_constant.dart';

import 'vera_lusso_add_address_controller.dart';

class VeraLussoAddAddressScreen extends GetView<VeraLussoAddAddressController> {
  const VeraLussoAddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _addressList = ["Address Book"];
    final List<String> _nameCategoryList = ["Mr", "Mrs", "Ms"];
    final List<String> _stateList = ["State/Province"];
    final List<String> _countryList = ["United States"];
    bool isChecked = false;
    final List<String> imgList = [
      "Change THE WORLD with Your Purchase",
    ];
    final CarouselController _controller = CarouselController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Column(
          children: [
            Container(
              height: 2,
              width: 160,
              color: Colors.red,
            ),
            Container(
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () => imgList.length > 1
                          ? _controller.previousPage()
                          : Container(),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 40,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      ),
                      carouselController: _controller,
                      items: imgList
                          .map((item) => Center(
                                  child: Text(
                                "${item}".toUpperCase(),
                                style: TextStyle(fontSize: 11),
                              )))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () => imgList.length > 1
                          ? _controller.nextPage()
                          : Container(),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              width: 160,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.scaffoldKey.value.currentState!
                              .openDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, top: 16, bottom: 16),
                          child: SvgPicture.asset(
                            ImageConstant.menuIcon,
                            color: Colors.black,
                            height: 12,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(ImageConstant.searchIcon),
                      ),
                    ],
                  ),
                  Image.asset(AppAsset.veraLussoLogo, width: 110),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          child: Image.asset(
                            AppAsset.user,
                            height: 16,
                            width: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Image.asset(
                                AppAsset.shoppingCart,
                                height: 16,
                                width: 16,
                                color: Colors.black,
                              ))),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          child: Container(
              height: 1.0, width: double.infinity, color: Colors.black),
          preferredSize: Size.fromHeight(2.0),
        ),
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 15.6,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 90),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                items: _addressList
                    .map((value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
                isExpanded: true,
                hint: Text(
                  "Address Book",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 28,
                  color: Colors.black,
                ),
                onChanged: (String? value) {},
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15.6,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: _nameCategoryList
                            .map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                            .toList(),
                        isExpanded: true,
                        hint: Text(
                          "Mr",
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: Colors.black45,
                        ),
                        onChanged: (String? value) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.only(bottom: 12, top: 12, left: 10),
                        hintText: "First name",
                        labelStyle: TextStyle(color: Colors.black54),
                        errorStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(0.0))),
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Enter First Name";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Surname",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Surname";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Company",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Company";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Phone Number";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Street Address 1",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Street Address";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Street Address 2",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Street Address";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Street Address 3",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Street Address";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "City",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter City";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 15.6,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: _stateList
                      .map((value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ))
                      .toList(),
                  isExpanded: true,
                  hint: Text(
                    "Please select a region, state or province.",
                  ),
                  icon: null,
                  iconEnabledColor: Colors.transparent,
                  onChanged: (String? value) {},
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(bottom: 12, top: 12, left: 10),
                  hintText: "Zip/Postcode",
                  labelStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(0.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Enter Zip/Postcode";
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 15.6,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: _countryList
                      .map((value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ))
                      .toList(),
                  isExpanded: true,
                  hint: Text(
                    "United States",
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: Colors.black45,
                  ),
                  onChanged: (String? value) {},
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Use as my default billing address",
                    style: TextStyle(color: Colors.black45, fontSize: 17))
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Use as my default shipping address",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 17,
                    ))
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Save Address",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "COMPANY",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.add,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black26,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contacts".toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.add,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black26,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTHERS".toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.add,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Subscribe to our Newsletter".toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Get all the latest information on Events,\nSales and Offers. Sign up for newsletter today.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.only(bottom: 12, top: 12, left: 10),
                        hintText: "Enter your email address",
                        labelStyle: TextStyle(color: Colors.black54),
                        errorStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                            color: Colors.black26,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(0.0))),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height / 15.6,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    "Subscribe".toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(height: 1.0, width: double.infinity, color: Colors.black),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.facebookIcon,
                height: 26,
                color: Colors.black,
              ),
              SizedBox(width: 14),
              Image.asset(
                AppAsset.twitterIcon,
                height: 26,
                color: Colors.black,
              ),
              SizedBox(width: 14),
              Image.asset(
                AppAsset.linkedInIcon,
                height: 26,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
