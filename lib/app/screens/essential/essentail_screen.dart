import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class EssentialScreen extends StatelessWidget {
  const EssentialScreen({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              runSpacing: 10,
              spacing: 2,
              children: [
                typeWidget('COOKIE POLICY'),
                typeWidget('ESSENTIAL'),
                typeWidget('ANALYTICAL'),
                typeWidget('PRIVACY POLICY'),
                typeWidget('ANALYTICAL'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ESSENTIAL',
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                CupertinoSwitch(
                  value: true,
                  activeColor: appColor,
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              height: 2,
              thickness: 1.4,
              color: appColor,
            ),
            const SizedBox(height: 15),
            const Text(
              'Essential Cookies Are Strictly Necessary To\nGuarantee The Proper Functioning Of The\n Website.',
              textAlign: TextAlign.left,
              style: TextStyle(
                height: 1.8,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget typeWidget(String value) {
    return Container(
      height: 27,
      width: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: appColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        value,
        style: TextStyle(
            fontSize: 12, color: appColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
