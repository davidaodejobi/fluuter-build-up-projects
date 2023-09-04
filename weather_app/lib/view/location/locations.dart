import 'package:flutter/material.dart';
import 'package:weather_app/view/location/widgets/city_forecast.dart';
import 'package:weather_app/view/location/widgets/search_location_app_bar.dart';

class LocationsScreen extends StatelessWidget {
  static const String id = "locations_screen";

  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchLocationAppBar(),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: ListView(
                    children: const [
                      CityForecast(
                        city: "Mumbai",
                        temperature: "16°C",
                        weatherCondition: "Light drizzle",
                        url: "assets/images/drizzle.png",
                      ),
                      CityForecast(
                        city: "Goa",
                        temperature: "26°C",
                        weatherCondition: "Sunny",
                        url: "assets/images/sunny.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
