// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsTextWidget extends StatelessWidget {
  const SettingsTextWidget({
    Key? key,
    required this.boldText,
    required this.firstLightText,
    required this.firstlightSubText,
    required this.secondLightText,
    required this.secondLightSubText,
    required this.isCheckedLightText,
    required this.isCheckedLightSubText,
  }) : super(key: key);

  final String boldText;
  final String firstLightText;
  final String firstlightSubText;
  final String secondLightText;
  final String secondLightSubText;
  final bool isCheckedLightText;
  final bool isCheckedLightSubText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Text(
          boldText,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20.0,
        ),
        LightText(
          lightText: firstLightText,
          lightSubText: firstlightSubText,
          isChecked: isCheckedLightText,
        ),
        LightText(
          lightText: secondLightText,
          lightSubText: secondLightSubText,
          isChecked: isCheckedLightSubText,
        ),
      ],
    );
  }
}

class LightText extends StatelessWidget {
  const LightText({
    Key? key,
    required this.lightText,
    required this.lightSubText,
    required this.isChecked,
  }) : super(key: key);

  final String lightText;
  final String lightSubText;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lightText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lightSubText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            isChecked
                ? const Icon(Icons.check)
                : const Visibility(visible: false, child: Icon(Icons.check)),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
