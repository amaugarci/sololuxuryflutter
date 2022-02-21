// Flutter imports:
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class DatepickerWidget extends StatefulWidget {
  const DatepickerWidget(
      {this.labelText,
      this.prefixIcon,
      this.controller,
      this.filled,
      this.decoration,
      required this.enabled,
      this.autovalidate,
      this.validator,
      this.lastDate,
      this.format});

  final String? labelText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool? filled;
  final InputDecoration? decoration;
  final bool enabled;
  final bool? autovalidate;
  final FormFieldValidator? validator;
  final DateTime? lastDate;
  final DateFormat? format;

  @override
  _DatepickerWidgetState createState() => _DatepickerWidgetState();
}

class _DatepickerWidgetState extends State<DatepickerWidget> {
  DateTime expirydate2 = DateTime.now();
  // final format = new DateFormat('E d,yyyy');

  static DateFormat dateFormat = DateFormat('MM-dd-yyyy');
  @override
  Widget build(BuildContext context) {
    return FormField(builder: (FormFieldState state) {
      return DateTimeField(
        enabled: widget.enabled,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: darkSilver),
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: darkSilver),
              borderRadius: BorderRadius.circular(8)),
          fillColor: offWhite,
          filled: true,
          // hintText: "Date",
          hintText: widget.labelText,
        ),
        validator: widget.validator,
        format: dateFormat,
        onShowPicker: (context, currentValue) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: expirydate2,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null && picked != expirydate2) {
            setState(() {
              expirydate2 = picked;
              print(expirydate2);
            });
          }
          return picked;
        },
      );
    });
  }
}
