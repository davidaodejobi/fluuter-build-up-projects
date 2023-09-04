// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/settings/widgets/settings_text_widget_without_checkbox.dart';

class SettingsTextWidget extends SettingsTextWithoutCheckbox {
  const SettingsTextWidget({
    super.key,
    required super.boldText,
    required super.firstLightText,
    required super.firstlightSubText,
    required super.secondLightText,
    required super.secondLightSubText,
    required this.isCheckedLightText,
    required this.isCheckedLightSubText,
    required this.checklightButton,
    required this.hideCheckButton,
  });

  final bool isCheckedLightText;
  final bool isCheckedLightSubText;
  final VoidCallback checklightButton;
  final bool hideCheckButton;

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
          isChecked: isCheckedLightText,
          checklightButton: checklightButton,
          hideCheckButton: hideCheckButton,
        ),
        LightText(
          lightText: secondLightText,
          lightSubText: secondLightSubText,
          isChecked: isCheckedLightSubText,
          checklightButton: checklightButton,
          hideCheckButton: hideCheckButton,
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
    required this.checklightButton,
    required this.hideCheckButton,
  }) : super(key: key);

  final String lightText;
  final String lightSubText;
  final bool isChecked;
  final VoidCallback checklightButton;
  final bool hideCheckButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lightText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // const SizedBox(
        //   height: 5.0,
        // ),
        GestureDetector(
          onTap: checklightButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lightSubText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              hideCheckButton
                  ? isChecked
                      // ? const Icon(Icons.check)
                      // : const Visibility(visible: false, child: Icon(Icons.check)),

                      ? const Checkbox(
                          value: true,
                          onChanged: null,
                        )
                      : const Checkbox(value: false, onChanged: null)
                  // : const Visibility(
                  //     visible: false,
                  //     child: Checkbox(value: false, onChanged: null),
                  //   ),
                  : const SizedBox(
                      height: 50,
                    )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 20.0,
        // ),
      ],
    );
  }
}
