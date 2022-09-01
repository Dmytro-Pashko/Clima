import 'package:clima/services/location_service.dart';
import 'package:clima/services/network_service.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationService locationService = LocationService();
  NetworkService networkService = NetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var userLocation = await locationService.getCurrentLocation();
    print("User location is $userLocation.");
    loadWeatherData(userLocation);
  }

  void loadWeatherData(Location location) async {
    var data = await networkService.getWeatherData(
        location.latitude, location.longitude);
    print(data);
  }
}
