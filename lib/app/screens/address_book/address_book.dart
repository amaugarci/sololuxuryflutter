import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'address_book_controller.dart';

class AddressBookScreen extends GetView<AddressBookController> {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressBookController());
    final List<String> _addressList = ["Address Book"];

    return Scaffold(
      key: controller.scaffoldKey.value,
      appBar: commonAppbar(title: LanguageConstant.addressBookText.tr),
      backgroundColor: backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height / 15.6,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(),
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
                    fontWeight: FontWeight.w400,
                    color: appColor,
                    fontSize: 18,
                  ),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 26,
                  color: appColor,
                ),
                onChanged: (String? value) {},
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
            color: Color(0xffF5E5DD),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    LanguageConstant.addressText.tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageConstant.billingText.tr.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          LanguageConstant.shippingText.tr.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Hitesh jfdsio, jfdsio,\nstreet-added-contc,\ncity-testing-named \n12345, italy. ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appColor.withOpacity(0.6), width: 2)),
                          child: Icon(Icons.check, size: 14, color: appColor),
                        ),
                        SizedBox(width: 0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: appColor.withOpacity(0.6),
                                    width: 2)),
                            child: Icon(
                              Icons.check,
                              size: 14,
                              color: appColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 0),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(height: 14),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                height: 1.2,
                width: double.infinity,
                color: appColor.withOpacity(0.8),
              )),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Hitesh jfdsio, jfdsio,\nstreet-added-contc,\ncity-testing-named \n12345, italy. ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appColor.withOpacity(0.6), width: 2)),
                          child: Icon(Icons.check, size: 14, color: appColor),
                        ),
                        SizedBox(width: 0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: appColor.withOpacity(0.6),
                                    width: 2)),
                            child: Icon(
                              Icons.check,
                              size: 14,
                              color: appColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 0),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if (value == 1) {
          // controller.aboutUsExpandableController.value.toggle();
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
