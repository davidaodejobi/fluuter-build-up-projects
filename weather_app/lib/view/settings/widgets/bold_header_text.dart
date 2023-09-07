import 'package:flutter/material.dart';
import 'package:weather_app/utils/theme_provider.dart';

class BoldHeaderText extends StatelessWidget {
  const BoldHeaderText({
    Key? key,
    required this.themeData,
    required this.boldHeaderText,
  }) : super(key: key);

  final ThemeProvider themeData;
  final String boldHeaderText;

  @override
  Widget build(BuildContext context) {
    return Text(
      boldHeaderText,
      style: themeData.themeMode
          ? Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black)
          : Theme.of(context).textTheme.headlineMedium,
    );
  }
}
