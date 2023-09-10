// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/forecast/widgets/daily_forecast.dart';
import 'package:weather_app/view/forecast/widgets/hourly_forecast.dart';
import 'package:weather_app/view/shared/app_bar.dart';

class ForecastScreen extends StatelessWidget {
  static const String id = "forecast_screen";

  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocationAppBar(),
                const SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Forecast",
                  style: themeData.themeMode
                      ? Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black)
                      : Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                const HourlyForecast(),
                const SizedBox(
                  height: 60.0,
                ),
                const DailyForecast(),
                const SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
