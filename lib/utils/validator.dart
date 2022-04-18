import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validators {
  static apiResponseMessage({body, success = false, message ,isDecode = true}) {
    Map response = jsonDecode(body);
    print("response['message'] -> ${message}");
    if(response['message']!=null){
      Get.snackbar("Alert", "${response['message']}", colorText: Colors.red);
    }else {
      Get.snackbar("Alert", "$message", colorText: Colors.red);
    }
  }

  static String? validateDigits(String value, String type, int length) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "$type is Required";
    } else if (value.length != length) {
      return "$type must be of $length digits";
    } else if (!regExp.hasMatch(value)) {
      return "$type must be a number. Example: 100";
    }
    return null;
  }
//   static String? validateContact(String value, String type) {
//     // Pattern pattern = r'^(?:[+0][1-9])?[0-9]{5,20}$';
//     // RegExp regExp = new RegExp(pattern);
// // !regExp.hasMatch(value.toString())
//     if (value.isNotEmpty) {
//       if (value.length < 11 || value.length > 20) {
//         return "Are you sure that you've entered your phone correctly?";
//       }
//     }
//     return null;
//   }

  static String? validateAmount(int? value, String type, String type2) {
    if (value == null || value < 10) {
      return "$type";
    } else if (value > 200) {
      return "$type2";
    } else {
      return null;
    }
  }

  static String? validateCharacter(String value, String type, int length) {
    String patttern = r'(^[a-zA-Z0-9]{8,16}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "$type is Required";
    } else if (value.length != length) {
      return "$type must be of $length character";
    } else if (!regExp.hasMatch(value)) {
      return "$type is invalid!";
    }
    return null;
  }

  static String? validateRequired(String value, String type) {
    if (value.length == 0) {
      return "$type is required";
    }
    return null;
  }

  static String? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // String patttern = r'(^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4,5})$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Phone number is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number is not valid";
    }
    return null;
  }

  String? validateGSTNumber(String value) {
    String pattern =
        r'(^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$)';
    // r'(^([0]{1}[1-9]{1}|[1-2]{1}[0-9]{1}|[3]{1}[0-7]{1})([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length != 0 && !regExp.hasMatch(value)) {
      return "GST Identification Number is not valid. It should be in this 11AAAAA1111Z1A1 format";
    }

    //  if (value.length == 0) {
    //   return "GST Number is Required";
    // } else
    return null;
  }

  //For Email Verification we using RegEx.
  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.length <= 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validateConfirmEmail(String? value, String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.length <= 0) {
      return "Confirm Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else if(value  !=  email) {
      return "Confirm email should be match with email";
    } else {
      return null;
    }
  }

  static String? validateName(String? value, String type) {
    String pattern = r'^[a-zA-Z ]{2,50}$';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.length < 3) {
      return "$type must be more than 2 charater";
    } else if (!regExp.hasMatch(value)) {
      return "Enter valid $type";
    } else {
      return null;
    }
  }

  // ignore: missing_return
  static String? validateText({String? value, String? text, int? maxLen}) {
    if (value.toString().length == 0) {
      return "$text is required";
    } else {
      if (value.toString().isNotEmpty) {
        if (value.toString().length < 3) {
          return "$text must have at least 2 characters";
        } else if (maxLen != null && value.toString().length > maxLen) {
          return "You have reached your maximum limit of characters allowed";
        } else {
          return null;
        }
      }
    }
  }

  static String? validatePassword(String value) {
    String pattern =
        r'^.*(?=.{8,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "The password must be at least 8 characters long and contain a mixture of both uppercase and lowercase letters, at least one number and one special character (e.g.,! @ # ?).";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String value, String password) {
    String pattern =
        r'^.*(?=.{8,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Confirm Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "The password must be at least 8 characters long and contain a mixture of both uppercase and lowercase letters, at least one number and one special character (e.g.,! @ # ?).";
    } else if(value  !=  password) {
      return "Confirm password should be match with password";
    }else {
      return null;
    }
  }

  String? validatepass(String value) {
    if (value.isEmpty) {
      return 'Please enter Password';
    }
    if (value.length < 9) {
      return 'Must be more than 8 charater';
    } else {
      return null;
    }
  }

  String? validateBusinessMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String? validateestablishedyear(String value) {
    var date = new DateTime.now();
    int currentYear = date.year;
    int userinputValue = 0;

    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    // int numValue = int.parse(value);
    if (!regExp.hasMatch(value)) {
      return "Year must be number only";
    } else if (value is String && value.length == 0) {
      return "Established Year is Required";
    } else {
      userinputValue = int.parse(value);
    }

    if (userinputValue < 1850 || userinputValue > currentYear) {
      return "Year must be between 1850 and $currentYear";
    }
    return null;
  }

  String? validateLicenseno(String value) {
    if (value.length == 0) {
      return "License No is Required";
    }
    return null;
  }

  String? validatenumberofemployee(String value) {
    String patttern = r'(^[1-9]\d*(\.\d+)?$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Number of employee is Required";
    } else if (value.length > 4) {
      return "Number of employee is not more than 9999";
    } else if (!regExp.hasMatch(value)) {
      return "Number of employee must be digits";
    }
    return null;
  }

  String? validatedate(String value) {
    String patttern = r'([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Date is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid date";
    }
    return null;
  }

  String? validateLicenseissuingauthority(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "License Issuing Authority is Required";
    } else if (!regExp.hasMatch(value)) {
      return "License Issuing Authority must be a-z and A-Z";
    }
    return null;
  }
}
