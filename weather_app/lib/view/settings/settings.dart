// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/settings/widgets/settings_app_bar.dart';
import 'package:weather_app/view/settings/widgets/settings_text_widget.dart';
import 'package:weather_app/view/settings/widgets/settings_text_widget_without_checkbox.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = "settings_screen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 25.0,
              right: 25.0,
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SettingsAppBar(),
                SettingsTextWidget(
                    boldText: "Theme",
                    firstLightText: "Dark Theme",
                    firstlightSubText: "Join the Dark Side!",
                    secondLightText: "Light Theme",
                    secondLightSubText: "Let There be Light!",
                    isCheckedLightText: themeData.isCheckedLightText,
                    isCheckedLightSubText: themeData.isCheckedLightSubText,
                    hideCheckButton: true,
                    checklightButton: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleThemeMode();
                    }),
                const SettingsTextWithoutCheckbox(
                  boldText: "Feedback",
                  firstLightText: "Report an Issue",
                  firstlightSubText:
                      "Facing an issue? Report and we’ll look into it.",
                  secondLightText: "Rate on App Store",
                  secondLightSubText:
                      "Enjoying the app? Leave a review on the App Store.",
                ),
                const SettingsTextWithoutCheckbox(
                  boldText: "About",
                  firstLightText: "About Weather",
                  firstlightSubText: "Read a bit more about the app.",
                  secondLightText: "The Team",
                  secondLightSubText:
                      "Get to know the team that made Weather a reality.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
