import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class CommonDivider extends StatelessWidget {
  Color color;
  double? width, height;

  CommonDivider({Key? key, this.color = appColorDarkLineGrey, this.width, this.height = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      color: color,
      height: height,
    );
  }
}
