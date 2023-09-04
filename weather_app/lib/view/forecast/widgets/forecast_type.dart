import 'package:flutter/material.dart';

class ForecastType extends StatelessWidget {
  const ForecastType({
    Key? key,
    required this.forecastText,
  }) : super(key: key);

  final String forecastText;

  @override
  Widget build(BuildContext context) {
    return Text(
      forecastText,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
