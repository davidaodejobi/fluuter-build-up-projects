// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';

class CityForecast extends StatelessWidget {
  const CityForecast({
    Key? key,
    required this.city,
    required this.temperature,
    required this.weatherCondition,
    required this.url,
  }) : super(key: key);

  final String city;
  final String temperature;
  final String weatherCondition;
  final String url;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: themeData.isLightMode
                      ? Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black)
                      : Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  temperature,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  weatherCondition,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SvgPicture.asset(
              url,
              width: 40,
              height: 40,
              colorFilter: themeData.isLightMode
                  ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
