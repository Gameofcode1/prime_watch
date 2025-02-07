// lib/styles.dart
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle textMedium(BuildContext context) {
    return TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: Theme.of(context).hintColor,
    );
  }

  static TextStyle boldText(BuildContext context) {
    return TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w400,
      letterSpacing: -2,
      color: Theme.of(context).hintColor,
    );
  }

  static TextStyle textSmall(BuildContext context) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: Theme.of(context).hintColor,
    );
  }

  static TextStyle subtitleTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).hintColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }
}