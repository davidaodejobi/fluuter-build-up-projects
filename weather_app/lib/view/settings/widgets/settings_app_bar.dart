import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back_ios,
          color: AppColors.lightTextColor,
          size: 15.0,
        ),
        Text('Settings', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
