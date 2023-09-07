import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:weather_app/models/location.dart';

class LocationData extends ChangeNotifier {
  final List<Location> _locationList = [
    Location("Ilorin", -16),
    Location("Lagos", -26),
    Location("Abuja", 30),
  ];

  UnmodifiableListView<Location> get locationList {
    return UnmodifiableListView(_locationList);
  }

  int get locationListLength {
    return locationList.length;
  }

  void addNewLocation(String city, int temperature, String weatherCondition) {
    _locationList.add(
      Location(city, temperature),
    );
    notifyListeners();
  }

  String getWeatherIconUrl(int temperature) {
    if (temperature > 30) {
      return 'assets/svgs/sun.svg';
    } else if (temperature >= 20) {
      return 'assets/svgs/cloud-sun.svg';
    } else if (temperature >= 15) {
      return 'assets/svgs/cloud.svg';
    } else if (temperature >= 10) {
      return 'assets/svgs/weather-overcast.svg';
    } else if (temperature > 0) {
      return 'assets/svgs/drizzle.svg';
    } else if (temperature <= 0.0 && temperature > -10.0) {
      return "assets/svgs/cloud-snow.svg";
    } else if (temperature <= -10.0 && temperature > -20.0) {
      return "assets/svgs/cloud-fog.svg";
    } else if (temperature <= -20.0) {
      return "assets/svgs/cloud-bolt.svg";
    } else {
      return "assets/svgs/windy-cloud.svg";
    }
  }

  String getWeatherType(int temperature) {
    if (temperature > 30) {
      return 'Hot Weather: Sunshine';
    } else if (temperature >= 20) {
      return 'Warm Weather: Partly Cloudy';
    } else if (temperature >= 15) {
      return 'Mild Weather: Cloudy ';
    } else if (temperature >= 10) {
      return 'Cold Weather: OverCast ';
    } else if (temperature > 0) {
      return 'Cold Weather: Raining';
    } else if (temperature <= 0.0 && temperature > -10.0) {
      return "Very Cold Wetaher: Snowy";
    } else if (temperature <= -10.0 && temperature > -20.0) {
      return "Freezing Weather: Foggy";
    } else if (temperature <= -20.0) {
      return "Extremely Cold Weather: Thunder & Lightning";
    } else {
      return "Windy";
    }
  }
}
