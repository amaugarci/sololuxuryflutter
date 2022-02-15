import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  int index = 0;

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
        child: Column(
          children: [
            Text(
              'PRIVACY POLICY',
              style: TextStyle(
                color: appColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            expandDetailWidget('PRIVACY POLICY', 1),
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
            expandDetailWidget('PRIVACY POLICY', 2),
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
            expandDetailWidget('PRIVACY POLICY', 3),
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
            expandDetailWidget('PRIVACY POLICY', 4),
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
                ? const Icon(Icons.remove, color: Colors.black)
                : const Icon(Icons.add, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
