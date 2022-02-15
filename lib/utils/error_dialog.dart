import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class ErrorDialog {
  static void showErrorDialog(String message, BuildContext context,
      {VoidCallback? onOkayPressed}) {
    AwesomeDialog(
      padding: EdgeInsets.all(10),
      dismissOnTouchOutside: false,
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.ERROR,

      title: "Error",
      // desc: message,
      body: Text(
        message.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: primaryBlack,
          fontSize: 16,
        ),
      ),
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.red,
      btnOkText: "Okay",
      btnOkOnPress: onOkayPressed ?? () {},
    ).show();
  }
}

class WarningDialog {
  static void showWarningDialog(String message, BuildContext context) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.WARNING,
      title: "Warning",
      // desc: message,
      body: Center(
        child: Text(
          message.toString(),
          style: TextStyle(
            color: primaryBlack,
            fontSize: 16,
          ),
        ),
      ),
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.yellow[700],
      btnOkText: "Okay",
      btnOkOnPress: () {},
    ).show();
  }
}

class SuccessDialog {
  static void showSuccessDialog(
      String message, Function onPress, BuildContext context) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.SUCCES,
      title: "Success",
      // desc: message,
      body: Text(
        message.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: primaryBlack,
          fontSize: 16,
        ),
      ),
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.green,
      btnOkText: "Okay",
      btnOkOnPress: onPress,
    ).show();
  }
}

class ConfirmationDialog {
  static void showConfirmationDialog(
      String title, String message, Function onOkPress, BuildContext context) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.INFO,
      title: title,
      // desc: message,
      body: Text(
        message.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: primaryBlack,
          fontSize: 16,
        ),
      ),
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.green,
      btnOkText: "Yes",
      btnOkOnPress: onOkPress,
      btnCancelIcon: Icons.cancel,
      btnCancelColor: Colors.red,
      btnCancelText: "No",
      btnCancelOnPress: () {},
    ).show();
  }
}
