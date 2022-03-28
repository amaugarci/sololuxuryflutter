import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class CommonTextFieldOpenSans extends StatelessWidget {
  double? width;
  String? hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  TextInputAction? keyboardInputAction;
  FormFieldValidator<String>? validator;
  bool? isValidationShow = true;
  Border? textFieldBorder;
  Color? textColor;
  String? fontFamily = "Open Sans";
  FontWeight? fontWeight;
  TextAlign? textAlign;
  Color? borderColor;
  double? height;
  ValueChanged<String>? onChanged;

  CommonTextFieldOpenSans(
      {Key? key,
      this.height = 40.0,
      this.hintText,
      this.controller,
      this.width,
      this.keyboardType,
      this.focusNode,
      this.keyboardInputAction,
      this.validator,
      this.isValidationShow = true,
      this.textFieldBorder,
      this.textAlign = TextAlign.left,
      this.textColor = Colors.black,
      this.borderColor = appColorButton,
      this.fontWeight = FontWeight.w400,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.0,
      width: width ?? MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(border: textFieldBorder ?? Border.all(color: borderColor!)),
      child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          textInputAction: keyboardInputAction,
          textAlign: textAlign!,
          onChanged: onChanged,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(
                r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])')),
            LengthLimitingTextInputFormatter(100), // for mobile
          ],
          validator: isValidationShow!
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                }
              : null,
          style: TextStyle(fontSize: 12.0, color: textColor, fontWeight: fontWeight, fontFamily: fontFamily),
          decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: hintText!,
              hintStyle: TextStyle(fontSize: 12.0, color: textColor, fontWeight: fontWeight, fontFamily: fontFamily))),
    );
  }
}
