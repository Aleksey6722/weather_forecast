import 'package:flutter/material.dart';
import 'package:weather_forecast/Screens/location_screen.dart';
// import 'package:weather_forecast/Screens/weather_forecast_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}


