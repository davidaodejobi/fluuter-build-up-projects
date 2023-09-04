// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(city, style: Theme.of(context).textTheme.headlineMedium),
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
            Image.asset(
              url,
              width: 40.0,
              height: 40.0,
            ),
          ],
        ),
        const SizedBox(
          height: 45.0,
        ),
      ],
    );
  }
}
