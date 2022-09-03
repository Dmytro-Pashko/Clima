import 'package:clima/screen/loading_screen.dart';
import 'package:clima/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  LocationService locationService = LocationService();

  void getCurrentLocation() async {
    Location currentLocation;
    try {
      currentLocation = await locationService.getCurrentLocation();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WeatherInfoLoadingScreen(
            location: currentLocation,
          ),
        ),
      );
    } catch (e) {
      showLocationFailedDialog();
    }
  }

  void showLocationFailedDialog() {
    // Alert dialog using custom alert style
    Alert(
      context: context,
      style: AlertStyle(
          isCloseButton: false,
          descStyle: TextStyle(
              color: Colors.white, fontFamily: 'VarelaRound', fontSize: 15)),
      type: AlertType.warning,
      desc:
          "Clima app cannot obtain your current location. Please enter your city manually or check your location option in settings and try again.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFF0095FF),
          radius: BorderRadius.circular(12.0),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Color(0xFF0B0C1E),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                  child: Text(
                    'Where are you?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'VarelaRound',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Text(
                    'To provide wheather data the Clima app need to know your current location',
                    style: TextStyle(
                      color: Color(0xFFBBBBC1),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'VarelaRound',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 65,
                  margin:
                      EdgeInsets.only(left: 50, right: 50, top: 40, bottom: 20),
                  child: TextButton.icon(
                    onPressed: () {
                      getCurrentLocation();
                    },
                    label: Text(
                      'USE CURRENT LOCATION',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        backgroundColor: Color(0xFF0095FF)),
                    icon: Icon(
                      Icons.my_location,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '-Or-',
                  style: TextStyle(
                    color: Color(0xFFBBBBC1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'VarelaRound',
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 65,
                  margin:
                      EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                  child: TextField(
                    onSubmitted: (value) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WeatherInfoLoadingScreen(
                            city: value,
                          ),
                        ),
                      );
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Enter your city name',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.location_city),
                      fillColor: Color(0xFF212748),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      filled: true,
                    ),
                  ),
                ),
                Expanded(
                    child: SvgPicture.asset(
                        fit: BoxFit.fitWidth, 'assets/images/location.svg')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
