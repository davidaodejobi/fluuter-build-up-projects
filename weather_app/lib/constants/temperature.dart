// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/constants/temperature_row.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    Key? key,
    required this.firstUrl,
    required this.firstTemperature,
    required this.secondUrl,
    required this.secondTemperature,
  }) : super(key: key);

  final String firstUrl;
  final String firstTemperature;
  final String secondUrl;
  final String secondTemperature;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        TemperatureRow(url: firstUrl, temperature: firstTemperature),
        const SizedBox(
          height: 10.0,
        ),
        TemperatureRow(url: secondUrl, temperature: secondTemperature),
      ],
    );
  }
}
