import 'package:flutter/material.dart';
import 'package:weather_app/view/forecast/widgets/forecast.dart';
import 'package:weather_app/view/forecast/widgets/forecast_type.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForecastType(
          forecastText: "Hourly Forecast",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              ForecastWidget(
                time: "10:00",
                svgUrl: "assets/svgs/drizzle.svg",
              ),
              ForecastWidget(
                time: "11:00",
                svgUrl: "assets/svgs/drizzle.svg",
              ),
              ForecastWidget(
                time: "12:00",
                svgUrl: "assets/svgs/sun.svg",
              ),
              ForecastWidget(
                time: "13:00",
                svgUrl: "assets/svgs/sun.svg",
              ),
              ForecastWidget(
                time: "14:00",
                svgUrl: "assets/svgs/sun.svg",
              ),
              ForecastWidget(
                time: "15:00",
                svgUrl: "assets/svgs/sun.svg",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
