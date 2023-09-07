import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/location.dart';

class LocationData extends ChangeNotifier {
  List<Location> _cityList = [];

  UnmodifiableListView<Location> get cityList {
    return UnmodifiableListView(_cityList);
  }

  Future<void> addNewCity(
    String city,
    int temperature,
    String weatherCondition,
  ) async {
    final newCity = Location(city, temperature);
    _cityList.add(newCity);
    await saveCity();
    notifyListeners();
  }

  Future<void> saveCity() async {
    final prefs = await SharedPreferences.getInstance();
    final citiesJsonList = _cityList.map((city) => city.toJson()).toList();
    await prefs.setStringList(
        'cities', citiesJsonList.map((e) => e.toString()).toList());
  }

  Future<void> displayCities() async {
    final prefs = await SharedPreferences.getInstance();
    final citiesJsonList = prefs.getStringList('cities') ?? [];

    _cityList =
        citiesJsonList.map((cityJson) => Location.fromJson(cityJson)).toList();

    notifyListeners();
  }

  // final List<Location> _cityList = [
  //   Location("Ilorin", -16),
  //   Location("Lagos", -26),
  //   Location("Abuja", 30),
  // ];

  int get locationListLength {
    return cityList.length;
  }

  // void addNewLocation(String city, int temperature, String weatherCondition) {
  //   _locationList.add(
  //     Location(city, temperature),
  //   );
  //   notifyListeners();
  // }

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
