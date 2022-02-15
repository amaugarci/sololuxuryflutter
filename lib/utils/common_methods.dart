import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class CommonMethod {
  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  printLog(dynamic log) {
    if (kDebugMode) {
      print("--------- App logs ---------\n$log");
    }
  }

  void getXSnackBar(String title, String message, Color? color) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: whiteColor,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: Duration(seconds: 4),
      borderRadius: 0,
      barBlur: 10,
    );
  }

  void getXConfirmationSnackBar(
    String title,
    String message,
    Function() onButtonPress,
  ) {
    Get.snackbar(title, message,
        mainButton: TextButton(
          onPressed: onButtonPress,
          child: Icon(Icons.delete, color: whiteColor),
        ),
        backgroundColor: blue,
        colorText: whiteColor,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: 6),
        borderRadius: 0,
        barBlur: 10,
        icon: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: whiteColor,
            )));
  }
}
