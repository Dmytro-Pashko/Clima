import 'dart:convert';

import 'package:clima/services/network_service.dart';

class WeatherService {
  WeatherData getWeatherData(Response response) {
    final String? responseBody = response.data;
    if (responseBody != null) {
      var data = jsonDecode(responseBody);

      String mainDescription = data['weather'][0]['main'];
      String icon = data['weather'][0]['icon'];
      String city = data['name'];
      double temperature = data['main']['temp'];
      int humidity = data['main']['humidity'];
      double windSpeed = data['wind']['speed'];
      int cloudiness = data['clouds']['all'];

      return WeatherData(
        mainDescription,
        icon,
        city,
        temperature,
        humidity,
        windSpeed,
        cloudiness,
      );
    } else {
      throw 'Response body is incorrect.';
    }
  }
}

class WeatherData {
  final String mainDescription;
  final String icon;
  final String city;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final int cloudiness;

  WeatherData(
    this.mainDescription,
    this.icon,
    this.city,
    this.temperature,
    this.humidity,
    this.windSpeed,
    this.cloudiness,
  );

  @override
  String toString() {
    return 'WeatherData{mainDescription: $mainDescription, icon: $icon, city: $city, temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed, cloudiness: $cloudiness}';
  }
}
