import 'package:clima/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherData weatherData;

  @override
  State<WeatherInfoScreen> createState() =>
      _WeatherInfoScreenState(weatherData);
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  final WeatherData weatherData;

  _WeatherInfoScreenState(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Color(0xFF0B0C1E),
        body: SafeArea(
           child: Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${weatherData.city}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'VarelaRound',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                        child: SvgPicture.asset('assets/images/${weatherData.icon}.svg'))),
                Text(
                  '${weatherData.mainDescription}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VarelaRound',
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    '${weatherData.temperature.round()}°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      roundedIconCard(
                        SvgPicture.asset('assets/images/wind_speed_2.svg'),
                        '${weatherData.windSpeed} m/s',
                        'Wind speed',
                      ),
                      roundedIconCard(
                        SvgPicture.asset('assets/images/cloudiness.svg'),
                        '${weatherData.cloudiness} %',
                        'Cloudiness',
                      ),
                      roundedIconCard(
                        SvgPicture.asset('assets/images/humidity.svg'),
                        '${weatherData.humidity} %',
                        'Humidity',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget roundedIconCard(SvgPicture icon, String value, String description) {
    return Container(
      child: Column(
        children: [
          Expanded(child: icon),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'VarelaRound',
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Color(0xFFBBBBC1),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'VarelaRound',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
