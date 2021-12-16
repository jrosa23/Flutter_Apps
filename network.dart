import 'dart:convert';
import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async{
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast?q="
        +cityName+
        ",us&APPID="
        +Util.appId+
        "&units=imperial";

    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.parse(finalUrl)}");

    if(response.statusCode == 200){
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
      //here we get actual mapped model (dart object)
    }else{
      throw Exception("Error getting weather forecast");
    }
  }
}