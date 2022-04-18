// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class CheckOutBox extends StatelessWidget {
  String? title;
  Widget? formFieldWidget;

  CheckOutBox({Key? key, this.formFieldWidget, this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            alignment: Alignment.centerLeft,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CommonTextPoppins(
                  title,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                color: appColorDarkLineGrey,
                height: 2.0,
              ),
              formFieldWidget!,
            ])));
  }
}
