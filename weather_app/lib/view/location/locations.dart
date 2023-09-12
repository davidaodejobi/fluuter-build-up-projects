import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/view/details/details_screen.dart';
import 'package:weather_app/view/location/widgets/add_location.dart';
import 'package:weather_app/view/location/widgets/city_forecast.dart';
import 'package:weather_app/view/location/widgets/search_location_app_bar.dart';

class LocationsScreen extends StatelessWidget {
  static const String id = "locations_screen";

  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationData>(context, listen: false).displayCities();
    return Scaffold(
      appBar: SearchLocationAppBar(
        addLocation: () {
          /// The implementation for this bottom sheet looks a
          /// little bit confusing, but it get the job done
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddLocation(),
              ),
            ),
          );
        },
      ),
      body: Consumer<LocationData>(
        builder: (context, cityData, child) {
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
                    const SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: cityData.locationListLength == 0
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svgs/umbrella.svg",
                                    width: 140,
                                    height: 140,
                                  ),
                                  Text(
                                    "Add a city",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontSize: 34.0,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: cityData.locationListLength,
                              itemBuilder: (context, index) {
                                final location = cityData.cityList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, DetailsScreen.id);
                                  },
                                  //TODO: 3 Add a slide to delete here just like the one for the note app
                                  child: CityForecast(
                                    city: location.city,
                                    temperature: location.temperature,
                                    weatherCondition: LocationData()
                                        .getWeatherType(location.temperature),
                                    url: LocationData().getWeatherIconUrl(
                                        location.temperature),
                                  ),
                                );
                              }),
                    ),
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
