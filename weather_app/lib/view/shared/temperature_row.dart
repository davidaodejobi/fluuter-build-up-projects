import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';

class TemperatureRow extends StatelessWidget {
  const TemperatureRow({
    super.key,
    required this.url,
    required this.temperature,
  });

  final String url;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        SvgPicture.asset(
          url,
          width: 11,
          height: 11,
          colorFilter: themeData.themeMode
              ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
              : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        Text(
          temperature,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
