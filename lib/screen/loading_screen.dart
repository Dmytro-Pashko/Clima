import 'package:clima/screen/location_screen.dart';
import 'package:clima/screen/weather_info_screen.dart';
import 'package:clima/services/location_service.dart';
import 'package:clima/services/network_service.dart';
import 'package:clima/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WeatherInfoLoadingScreen extends StatefulWidget {
  const WeatherInfoLoadingScreen({
    Key? key,
    this.city,
    this.location,
  }) : super(key: key);

  final String? city;
  final Location? location;

  @override
  State<WeatherInfoLoadingScreen> createState() =>
      WeatherInfoLoadingScreenState(city, location);
}

class WeatherInfoLoadingScreenState extends State<WeatherInfoLoadingScreen> {
  WeatherInfoLoadingScreenState(this.city, this.location);

  final NetworkService networkService = NetworkService();
  final WeatherService weatherService = WeatherService();
  final String? city;
  final Location? location;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF0B0C1E),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCircle(
                  color: Colors.white,
                  size: 75,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Loading weather data...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'VarelaRound',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }

  void loadWeatherData() async {
    final location = this.location;
    final city = this.city;

    Response? response;
    if (location != null) {
      response = await networkService.getWeatherDataForLocation(
          location.latitude, location.longitude);
    } else if (city != null) {
      response = await networkService.getWeatherDataForCity(city);
    } else {
      showLoadingError();
    }
    if (response != null && response.isSuccess()) {
      WeatherData weatherData = weatherService.getWeatherData(response);
      print('Received weather data: $weatherData');
      showWeatherInfo(weatherData);
    } else {
      setState(() {
        showLoadingError();
      });
    }
  }

  void showWeatherInfo(WeatherData weatherData) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => WeatherInfoScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  void showLoadingError() {
    Alert(
      context: context,
      style: AlertStyle(
          isCloseButton: false,
          descStyle: TextStyle(
              color: Colors.white, fontFamily: 'VarelaRound', fontSize: 15)),
      type: AlertType.warning,
      desc:
          "Clima app cannot obtain weather data for your city, please check your internet connection and try again.",
      buttons: [
        DialogButton(
          child: Text(
            "Try Again",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => {Navigator.pop(context), loadWeatherData()},
          color: Color(0xFF0095FF),
          radius: BorderRadius.circular(12.0),
        ),
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => {
            Navigator.pop(context),
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LocationScreen(),
              ),
            )
          },
          color: Color(0xFF0095FF),
          radius: BorderRadius.circular(12.0),
        ),
      ],
    ).show();
  }
}
