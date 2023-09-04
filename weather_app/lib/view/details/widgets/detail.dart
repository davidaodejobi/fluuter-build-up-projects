import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.detail,
    required this.value,
  }) : super(key: key);

  final String detail;
  final String value;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detail,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          value,
          style: themeData.isLightMode
              ? Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black)
              : Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
