import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/temperature_row.dart';
import 'package:weather_app/utils/theme_provider.dart';
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
    final themeData = Provider.of<ThemeProvider>(context);
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
                      style: themeData.isLightMode
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black)
                          : Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SvgPicture.asset(
                      svgUrl,
                      colorFilter: themeData.isLightMode
                          ? const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        TemperatureRow(
                          url: firstUrl,
                          temperature: firstTemperature,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TemperatureRow(
                          url: secondUrl,
                          temperature: secondTemperature,
                        ),
                      ],
                    ),
                    // Temperature(
                    //   firstUrl: firstUrl,
                    //   firstTemperature: firstTemperature,
                    //   secondUrl: secondUrl,
                    //   secondTemperature: secondTemperature,
                    // ),
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
