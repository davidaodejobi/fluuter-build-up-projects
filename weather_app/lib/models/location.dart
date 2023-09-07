import 'dart:convert';

class Location {
  final String city;
  final int temperature;

  Location(this.city, this.temperature);

  factory Location.fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Location(
      json['city'],
      json['temperature'],
    );
  }

  String toJson() {
    return jsonEncode({
      'city': city,
      'temperature': temperature,
    });
  }
}
