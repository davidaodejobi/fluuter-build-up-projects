import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/view/details/details_screen.dart';
import 'package:weather_app/view/location/widgets/city_forecast.dart';
import 'package:weather_app/view/location/widgets/search_location_app_bar.dart';

class LocationsScreen extends StatelessWidget {
  static const String id = "locations_screen";

  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationData>(
        builder: (context, locationData, child) {
          return SafeArea(
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
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
                        child: ListView.builder(
                            itemCount: locationData.locationListLength,
                            itemBuilder: (context, index) {
                              final location = locationData.locationList[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailsScreen.id);
                                },
                                child: CityForecast(
                                  city: location.city,
                                  temperature: location.temperature,
                                  weatherCondition: location.weatherCondition,
                                  url: "assets/svgs/drizzle.svg",
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
