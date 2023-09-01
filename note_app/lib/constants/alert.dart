import 'package:flutter/material.dart';

class Alert {
  final String titleText;
  final TextStyle? titleTextStyle;
  final String firstButtonText;
  final String secondButtonText;
  final Color? iconColor;
  final bool isTrue;
  final bool isFalse;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final Color firstButtonColor;
  final Color secondButtonColor;
  final VoidCallback firstbuttonAction;
  final VoidCallback secondButtonAction;

  Alert({
    required this.titleText,
    required this.titleTextStyle,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.iconColor,
    required this.isTrue,
    required this.isFalse,
    required this.firstTextStyle,
    required this.secondTextStyle,
    required this.firstButtonColor,
    required this.secondButtonColor,
    required this.firstbuttonAction,
    required this.secondButtonAction,
  });
}
