import 'package:flutter/material.dart';

// Padding
const EdgeInsets horizonatal20 = EdgeInsets.symmetric(horizontal: 20);
EdgeInsets customVerticalHorizontal20({double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: 20, vertical: vertical);

// Sizedbox
SizedBox customWidth(double width) => SizedBox(width: width);
const SizedBox width10 = SizedBox(width: 10);
const SizedBox width15 = SizedBox(width: 15);

SizedBox customHeight(double height) => SizedBox(height: height);
const SizedBox height10 = SizedBox(height: 10);
const SizedBox height15 = SizedBox(height: 15);
const SizedBox height16 = SizedBox(height: 16);

BorderRadius circularBorderRadius(double radius) =>
    BorderRadius.circular(radius);
BorderRadius circular5BorderRadius = BorderRadius.circular(4);
BorderRadius circular8BorderRadius = BorderRadius.circular(8);
BorderRadius circular10BorderRadius = BorderRadius.circular(10);
BorderRadius circular15BorderRadius = BorderRadius.circular(15);
BorderRadius circular20BorderRadius = BorderRadius.circular(20);
BorderRadius circular30BorderRadius = BorderRadius.circular(30);
