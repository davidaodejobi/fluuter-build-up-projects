import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/constants/temperature.dart';
import 'package:weather_app/view/forecast/widgets/forecast.dart';

class DailyWidget extends ForecastWidget {
  const DailyWidget(
      {super.key,
      required this.firstTemperature,
      required this.firstUrl,
      required this.secondTemperature,
      required this.secondUrl,
      required super.time,
      required super.svgUrl});

  final String firstUrl;
  final String firstTemperature;
  final String secondUrl;
  final String secondTemperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SvgPicture.asset(svgUrl),
                    Temperature(
                      firstUrl: firstUrl,
                      firstTemperature: firstTemperature,
                      secondUrl: secondUrl,
                      secondTemperature: secondTemperature,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30.0,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
