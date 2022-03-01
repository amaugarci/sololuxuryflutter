import 'package:flutter/material.dart';

class CommonTextOpenSans extends StatelessWidget {
  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  int? maxLine;
  TextDecoration? decoration;
  TextOverflow? overflow;
  double? height;

  CommonTextOpenSans(
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
          fontFamily: "OpenSans",
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
