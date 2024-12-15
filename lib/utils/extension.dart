import 'package:flutter/material.dart';

extension SizedExtension on double {
  addHSpace() {
    return SizedBox(height: this);
  }

  addWSpace() {
    return SizedBox(width: this);
  }
}

extension AppValidation on String {
  isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension TextExtension on String {
  txt({TextStyle? style, TextAlign? textAlign, int? maxLine}) {
    return Text(
      this,
      style: style,
      textAlign: textAlign,
      maxLines: maxLine,
    );
  }
}
