import 'package:clima/screen/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          body: IntroScreen(),
        ),
      ),
    );
  }
}
