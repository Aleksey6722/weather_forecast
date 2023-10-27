import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecast/Screens/weather_forecast_screen.dart';
import 'package:weather_forecast/api/weather_api.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void getLOcationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return WeatherForecastScreen(locationWeather: weatherInfo,);
      }));
    } catch(e) {
      if(e.toString() == 'User denied Geolocation'){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return WeatherForecastScreen(locationWeather: null,);
        }));
      }
    }
  }

  @override
  void initState() {
    getLOcationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black87, size: 100,),
      ),
    );
  }
}
