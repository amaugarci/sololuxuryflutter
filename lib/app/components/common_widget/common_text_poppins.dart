import 'package:flutter/material.dart';
import 'package:solo_luxury/utils/app_constants.dart';

class CommonTextPoppins extends StatelessWidget {
  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  int? maxLine;
  TextDecoration? decoration;
  TextOverflow? overflow;
  double? height;

  CommonTextPoppins(
      this.text ,
      {Key? key,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.textAlign,
        this.height,
        this.maxLine, this.decoration, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: overflow,
      style: TextStyle(
          fontFamily: AppConstants.fontPoppins,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration
      ),
      textAlign: textAlign,
      maxLines: maxLine,
    );
  }
}
