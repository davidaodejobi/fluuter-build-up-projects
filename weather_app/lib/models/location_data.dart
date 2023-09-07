import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:weather_app/models/location.dart';

class LocationData extends ChangeNotifier {
  final List<Location> _locationList = [
    Location("Mumbai", "16°C", "Light Drizzle"),
    Location("Goa", "26°C", "Sunny"),
  ];

  UnmodifiableListView<Location> get locationList {
    return UnmodifiableListView(_locationList);
  }

  int get locationListLength {
    return locationList.length;
  }

  void addNewLocation(
      String city, String temperature, String weatherCondition) {
    _locationList.add(
      Location(city, temperature, weatherCondition),
    );
    notifyListeners();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
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
