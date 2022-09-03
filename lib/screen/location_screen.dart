import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationScreen extends StatelessWidget {
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
                    onPressed: () {},
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
