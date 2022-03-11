// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';

enum ButtonType {
  TextButton,
  ElevatedButton,
  OutlinedButton,
}

// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  ButtonType? buttonType;

  /// Use either `child` or `lable` property
  Widget? child;
  Icon? iconn;

  /// Use `icon` property for icon button
  final IconData? icon;

  /// Use either `child` or `lable` property
  final String? lable;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final double? elevation; //not for flat button

  /// For text size, weight.
  /// Use color property for text color
  final TextStyle? textStyle;

  /// for button border of type BorderSide(color,width,style)
  final BorderSide? border;

  /// it apply circular border type
  double? borderRadius;

  /// if want to apply custome border shape, For circular border give only borderRadius property
  OutlinedBorder? shape;

  ButtonStyle? buttonStyle;

  CommonButton({
    Key? key,
    @required this.buttonType,
    required this.onPressed,
    this.lable,
    this.child,
    this.icon,
    this.color,
    this.textColor,
    this.shadowColor,
    this.border,
    this.borderRadius = 0.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.elevation,
    this.focusNode,
    this.shape,
    this.textStyle,
  }) : super(key: key);

  Widget myButton() {
    switch (buttonType) {
      case ButtonType.TextButton:
        buttonStyle = TextButton.styleFrom(
          backgroundColor: color,
          primary: textColor,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: Colors.transparent,
          textStyle: textStyle,
        );
        return textButton();
        break;

      case ButtonType.OutlinedButton:
        buttonStyle = OutlinedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: color,
          primary: textColor,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: Colors.transparent,
          textStyle: textStyle,
        );
        return outlinedButton();
        break;

      case ButtonType.ElevatedButton:
        buttonStyle = ElevatedButton.styleFrom(
          primary: color,
          onPrimary: textColor,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: Colors.transparent,
          textStyle: textStyle,
        );
        return elevatedButton();
        break;

      default:
        buttonStyle = TextButton.styleFrom(
          backgroundColor: color,
          primary: textColor,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: shadowColor,
          textStyle: textStyle,
        );
        return textButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(borderRadius==0.0) {
      shape = const RoundedRectangleBorder(borderRadius: BorderRadius.zero);
    }else{
      shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!));
    }

    if (lable != null) {
      child = CommonTextPoppins(
        lable,
      );
    }

    if (icon != null) {
      iconn = Icon(
        icon,
      );
    }

    return myButton();
  }

  TextButton textButton() {
    if (icon != null) {
      return TextButton.icon(
        icon: iconn!,
        label: child!,
        onPressed: onPressed,
        style: buttonStyle,
        focusNode: focusNode,
      );
    }
    return TextButton(
      child: child!,
      onPressed: onPressed,
      style: buttonStyle,
      focusNode: focusNode,
    );
  }

  OutlinedButton outlinedButton() {
    if (icon != null) {
      return OutlinedButton.icon(
        icon: iconn!,
        label: child!,
        onPressed: onPressed,
        style: buttonStyle,
        focusNode: focusNode,
      );
    }
    return OutlinedButton(
      child: child!,
      onPressed: onPressed,
      style: buttonStyle,
      focusNode: focusNode,
    );
  }

  ElevatedButton elevatedButton() {
    if (icon != null) {
      return ElevatedButton.icon(
        icon: iconn!,
        label: child!,
        onPressed: onPressed,
        style: buttonStyle,
        focusNode: focusNode,
      );
    }
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
      style: buttonStyle,
      focusNode: focusNode,
    );
  }
}
