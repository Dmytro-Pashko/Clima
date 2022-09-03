import 'package:clima/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFF0B0C1E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                  width: double.infinity,
                  child: SvgPicture.asset('assets/images/intro.svg'))),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Discover the Weather in Your City',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'VarelaRound',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Text(
              'Get to know the current weather and forecast in your city.',
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
            margin: EdgeInsets.all(25),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LocationScreen(),
                    ),
                  );
                },
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'VarelaRound',
                  ),
                ),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color(0xFF0095FF))),
          )
        ],
      ),
    );
  }
}
