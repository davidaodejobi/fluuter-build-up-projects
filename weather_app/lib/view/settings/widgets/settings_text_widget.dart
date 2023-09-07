// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/view/settings/widgets/header_checkbox.dart';

class SettingsTextWidget extends StatelessWidget {
  const SettingsTextWidget({
    Key? key,
    required this.headerText,
    required this.headerSubText,
    required this.checkIconButton,
    required this.showCheckButton,
    required this.isVisible,
  }) : super(key: key);

  final String headerText;
  final String headerSubText;
  final VoidCallback checkIconButton;
  final bool showCheckButton;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: checkIconButton,
          child: HeaderCheckBox(
            headerText: headerText,
            headerSubText: headerSubText,
            isChecked: showCheckButton,
            isVisible: isVisible,
          ),
        ),
      ],
    );
  }
}
