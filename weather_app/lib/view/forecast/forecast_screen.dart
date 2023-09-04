// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_bar.dart';
import 'package:weather_app/view/forecast/widgets/daily_forecast.dart';
import 'package:weather_app/view/forecast/widgets/hourly_forecast.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 15.0,
              right: 15.0,
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
                  style: Theme.of(context).textTheme.headlineMedium,
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
