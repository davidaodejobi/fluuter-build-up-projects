// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/settings/widgets/light_text.dart';

class SettingsTextWithoutCheckbox extends StatelessWidget {
  const SettingsTextWithoutCheckbox({
    Key? key,
    required this.boldText,
    required this.firstLightText,
    required this.firstlightSubText,
    required this.secondLightText,
    required this.secondLightSubText,
  }) : super(key: key);

  final String boldText;
  final String firstLightText;
  final String firstlightSubText;
  final String secondLightText;
  final String secondLightSubText;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Text(
          boldText,
          style: themeData.isLightMode
              ? Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black)
              : Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20.0,
        ),
        LightText(
          lightText: firstLightText,
          lightSubText: firstlightSubText,
        ),
        LightText(
          lightText: secondLightText,
          lightSubText: secondLightSubText,
        ),
      ],
    );
  }
}
