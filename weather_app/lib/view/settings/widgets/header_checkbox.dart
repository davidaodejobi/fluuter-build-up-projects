// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';

class HeaderCheckBox extends StatelessWidget {
  const HeaderCheckBox({
    Key? key,
    required this.headerText,
    required this.headerSubText,
    required this.isChecked,
    required this.isVisible,
  }) : super(key: key);

  final String headerText;
  final String headerSubText;
  final bool isChecked;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headerText,
              style: themeData.themeMode
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white70,
                      ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              headerSubText,
              style: themeData.themeMode
                  ? Theme.of(context).textTheme.bodySmall
                  : Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                      ),
            ),
          ],
        ),
        isVisible
            ? isChecked
                ? const Icon(Icons.check)
                : Icon(
                    Icons.check,
                    color: Provider.of<ThemeProvider>(context).themeMode
                        ? Colors.white30
                        : Colors.black,
                  )
            : Container(),
      ],
    );
  }
}
