import 'dart:convert';

class Location {
  final int id;
  final String city;
  final int temperature;

  Location(this.city, this.temperature, this.id);

  factory Location.fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Location(
      json['city'],
      json['temperature'],
      json['id'],
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      'city': city,
      'temperature': temperature,
    });
  }
}
