// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/settings/widgets/bold_header_text.dart';
import 'package:weather_app/view/settings/widgets/settings_app_bar.dart';
import 'package:weather_app/view/settings/widgets/settings_text_widget.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = "settings_screen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);
    final themeDataListen = Provider.of<ThemeProvider>(context, listen: false);

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
              children: [
                const SettingsAppBar(),
                const SizedBox(
                  height: 30.0,
                ),
                BoldHeaderText(boldHeaderText: "Theme", themeData: themeData),
                SettingsTextWidget(
                  headerText: "Dark Theme",
                  headerSubText: "Join the Dark Side!",
                  showCheckButton: themeData.checkDarkMode,
                  checkIconButton: () {
                    if (themeData.checkDarkMode == true) {
                      themeDataListen.dontToggleThemeMode();
                    } else {
                      themeDataListen.toggleThemeMode();
                    }
                  },
                  isVisible: true,
                ),
                SettingsTextWidget(
                  headerText: "Light Theme",
                  headerSubText: "Let There be Light!",
                  showCheckButton: themeData.checkLightMode,
                  checkIconButton: () {
                    if (themeData.checkLightMode == true) {
                      themeDataListen.dontToggleThemeMode();
                    } else {
                      themeDataListen.toggleThemeMode();
                    }
                  },
                  isVisible: true,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                BoldHeaderText(
                    boldHeaderText: "Feedback", themeData: themeData),
                SettingsTextWidget(
                  headerText: "Report an Issue",
                  headerSubText:
                      "Facing an issue? Report and we’ll look into it.",
                  showCheckButton: false,
                  checkIconButton: () {},
                  isVisible: false,
                ),
                SettingsTextWidget(
                  headerText: "Rate on App Store",
                  headerSubText:
                      "Enjoying the app? Leave a review on the App Store.",
                  showCheckButton: false,
                  checkIconButton: () {},
                  isVisible: false,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                BoldHeaderText(boldHeaderText: "About", themeData: themeData),
                SettingsTextWidget(
                  headerText: "About Weather",
                  headerSubText: "Read a bit more about the app.",
                  showCheckButton: false,
                  checkIconButton: () {},
                  isVisible: false,
                ),
                SettingsTextWidget(
                  headerText: "The Team",
                  headerSubText:
                      "Get to know the team that made Weather a reality.",
                  showCheckButton: false,
                  checkIconButton: () {},
                  isVisible: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
