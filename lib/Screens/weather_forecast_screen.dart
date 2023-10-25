
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecast/Screens/city_screen.dart';
import 'package:weather_forecast/api/weather_api.dart';
import 'package:weather_forecast/models/weather_forecast_daily.dart';
import 'package:weather_forecast/widgets/bottom_list_view.dart';
import 'package:weather_forecast/widgets/city_view.dart';
import 'package:weather_forecast/widgets/detail_view.dart';
import 'package:weather_forecast/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'Oskemen';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
    // forecastObject.then((weather) {
    //   print('the weather: ${weather.list![0].weather![0].main}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            onPressed: () async {
             var tappedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CityScreen();
              },),);
             if(tappedName != null){
               setState(() {
                 _cityName= tappedName;
                 forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
               });
             }
            },
            icon: Icon(Icons.location_city),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Column(children: [
                    SizedBox(height: 50,),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50,),
                    TempView(snapshot: snapshot),
                    SizedBox(height: 50,),
                    DetailView(snapshot: snapshot),
                    SizedBox(height: 50,),
                    BottomListView(snapshot: snapshot),
                  ],);
                } else {
                  return Center(child: SpinKitDoubleBounce(color: Colors.black87, size: 100,),);
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}
