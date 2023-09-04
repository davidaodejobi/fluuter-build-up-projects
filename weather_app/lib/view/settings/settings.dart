// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/view/settings/widgets/settings_app_bar.dart';
import 'package:weather_app/view/settings/widgets/settings_text_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsAppBar(),
                SettingsTextWidget(
                  boldText: "Theme",
                  firstLightText: "Dark Theme",
                  firstlightSubText: "Join the Dark Side!",
                  secondLightText: "Light Theme",
                  secondLightSubText: "Let There be Light!",
                  isCheckedLightText: false,
                  isCheckedLightSubText: true,
                ),
                SettingsTextWidget(
                  boldText: "Feedback",
                  firstLightText: "Report an Issue",
                  firstlightSubText:
                      "Facing an issue? Report and we’ll look into it.",
                  secondLightText: "Rate on App Store",
                  secondLightSubText:
                      "Enjoying the app? Leave a review on the App Store.",
                  isCheckedLightText: false,
                  isCheckedLightSubText: false,
                ),
                SettingsTextWidget(
                  boldText: "About",
                  firstLightText: "About Weather",
                  firstlightSubText: "Read a bit more about the app.",
                  secondLightText: "The Team",
                  secondLightSubText:
                      "Get to know the team that made Weather a reality.",
                  isCheckedLightText: false,
                  isCheckedLightSubText: false,
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
