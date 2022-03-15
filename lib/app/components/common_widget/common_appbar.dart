import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import 'common_text_opensans.dart';

PreferredSizeWidget commonAppbar({String title = ""}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.close,
        size: 24.0,
      ),
    ),
    elevation: 0,
    backgroundColor: backGroundColor,
    iconTheme: const IconThemeData(color: Colors.black),
    title: CommonTextOpenSans(title, color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500,),
  );
}
