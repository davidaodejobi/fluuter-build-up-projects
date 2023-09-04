import 'package:flutter/material.dart';
import 'package:weather_app/view/forecast/widgets/daily.dart';
import 'package:weather_app/view/forecast/widgets/forecast_type.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForecastType(
          forecastText: "Daily Forecast",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              DailyWidget(
                time: "26 Dec",
                svgUrl: "assets/svgs/drizzle.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
              DailyWidget(
                time: "27 Dec",
                svgUrl: "assets/svgs/drizzle.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
              DailyWidget(
                time: "28 Dec",
                svgUrl: "assets/svgs/sun.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
              DailyWidget(
                time: "29 Dec",
                svgUrl: "assets/svgs/sun.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
              DailyWidget(
                time: "30 Dec",
                svgUrl: "assets/svgs/sun.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
              DailyWidget(
                time: "31 Dec",
                svgUrl: "assets/svgs/drizzle.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
              DailyWidget(
                time: "1 Jan",
                svgUrl: "assets/svgs/drizzle.svg",
                firstTemperature: '26°C',
                firstUrl: "assets/svgs/up_arrow.svg",
                secondTemperature: '16°C',
                secondUrl: 'assets/svgs/down_arrow.svg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
