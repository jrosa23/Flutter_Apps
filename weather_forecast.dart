import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/network/network.dart';
import 'package:first_flutter_app/weather_forecast/ui/bottom_view.dart';
import 'package:first_flutter_app/weather_forecast/ui/mid_view.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatefulWidget{
  const WeatherForecast({Key? key}) : super(key: key);
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  late String _cityName = "Orlando";

  @override
  void initState(){
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel>snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                      bottom_view(snapshot, context)
                    ]
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              }
            ),
          )
        ]
      ),
    );
  }

  Widget textFieldView(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child:  TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name...",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.all(9.0)
            ),
          onSubmitted: (value){
              setState(() {
                _cityName = value;
                forecastObject = getWeather(cityName: _cityName);
              });
            },
          ),
        ),
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}