import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  _TermsAndConditionScreenState createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(title: LanguageConstant.privacyPolicyText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            Text(
              'TERMS AND CONDITION',
              style: TextStyle(
                color: appColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            expandDetailWidget('About Us', 1),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 1 ? true : false,
              child: const Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Our Services', 2),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 2 ? true : false,
              child: const Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Delivery', 3),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 3 ? true : false,
              child: const Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Our Website', 4),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 4 ? true : false,
              child: const Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Final Sale', 5),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 5 ? true : false,
              child: const Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandDetailWidget(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == value) {
            index = 0;
          } else {
            index = value;
          }
        });
      },
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            index == value
                ? Icon(Icons.remove, color: appColor)
                : Icon(Icons.add, color: appColor),
          ],
        ),
      ),
    );
  }
}
