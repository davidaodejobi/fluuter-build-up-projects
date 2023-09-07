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

  void addNewLocation(
      String city, String temperature, String weatherCondition) {
    _locationList.add(
      Location(city, temperature, weatherCondition),
    );
    notifyListeners();
  }

  int get locationListLength {
    return locationList.length;
  }
}
