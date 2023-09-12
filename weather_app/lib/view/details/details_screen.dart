// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/details/widgets/detail.dart';
import 'package:weather_app/view/forecast/forecast_screen.dart';
import 'package:weather_app/view/shared/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = "details_screen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: const LocationAppBar(
          city: 'Ilorin', location: "Current Location", isArrowVisible: true),
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO:2 I am not currently looking at the user, but this screen should have a back button.
                /// more reason why you need to have a solid appbar you can reuse across the app

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Details",
                      style: themeData.themeMode
                          ? Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.black)
                          : Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForecastScreen.id);
                      },
                      child: Text(
                        "Forecsast",
                        style: themeData.themeMode
                            ? Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.black)
                            : Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                const Details(detail: "Precipitation", value: "0.0 mm"),
                const Details(detail: "SE Wind", value: "10.23 km/h"),
                const Details(detail: "Humidity", value: "56%"),
                const Details(detail: "Visibility", value: "14.83 km"),
                const Details(detail: "UV", value: "Lowest"),
                const Details(detail: "Pressure", value: "1012 hPa"),
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
