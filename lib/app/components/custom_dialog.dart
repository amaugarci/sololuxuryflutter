import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/buttons/outline_button.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/app_text_style.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/app/utils/static_decoration.dart';

import '../app.dart';

class ErrorDialog {
  static void showErrorDialog({required String errorMessage}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => commonDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAsset.dialogError,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.normalRegular16,
                    ),
                    OutlineBorderButton(
                      textColor: Colors.redAccent,
                      title: 'OK',
                      onPressed: () => Get.back(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessDialog {
  static void showSuccessDialog(
      {required String successMessage, required VoidCallback onPressed}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => commonDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAsset.dialogSuccess,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      successMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.normalRegular16,
                    ),
                    OutlineBorderButton(
                      borderColor: success,
                      textColor: success,
                      title: 'OK',
                      onPressed: onPressed,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WarningDialog {
  static void showWarningDialog({
    required String warningMessage,
    required VoidCallback onCancel,
    required VoidCallback onPressed,
    String? rightButtonTitle,
    String? leftButtonTitle,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => commonDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAsset.dialogInfo,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      warningMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.normalRegular16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlineBorderButton(
                            borderColor: infoDialog,
                            textColor: infoDialog,
                            title: leftButtonTitle ?? 'CANCEL',
                            onPressed: onCancel,
                          ),
                        ),
                        width10,
                        Expanded(
                          child: OutlineBorderButton(
                            borderColor: infoDialog,
                            title: rightButtonTitle ?? 'OK',
                            onPressed: onPressed,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget commonDialog({required Widget child}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: circular8BorderRadius),
    elevation: 1,
    insetPadding: EdgeInsets.all(25),
    child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: circular8BorderRadius,
        ),
        child: child),
  );
}
