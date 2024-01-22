import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class BorderTextFormField extends StatelessWidget {
  BorderTextFormField(
      {super.key,
      required this.prefixIcon,
      this.suffixIcon,
      required this.hint,
      required this.controller,
      this.readOnly = false,
      this.onTap,
      required this.validator,
      required this.fontSize});

  final commonBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(width: 1, color: textFieldBorder),
  );

  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hint;
  final TextEditingController controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final double fontSize;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: fontSize, color: black),
      keyboardType: TextInputType.text,
      cursorColor: black,
      decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          filled: true,
          fillColor: white,
          prefixIcon: Icon(prefixIcon, color: primaryColor, size: 24),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: primaryColor, size: 24)
              : null,
          focusedBorder: commonBorder,
          disabledBorder: commonBorder,
          enabledBorder: commonBorder,
          border: commonBorder,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: commonBorder,
          hintStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: textFieldHintColor),
          hintText: hint),
    );
  }
}
