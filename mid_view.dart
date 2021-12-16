import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/util/convert_icon.dart';
import 'package:first_flutter_app/weather_forecast/util/forecast_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city.name;
  var country = snapshot.data!.city.country;
  var formattedDate = DateTime.fromMicrosecondsSinceEpoch(forecastList[0].dt * 1000000);
  var forecast = forecastList[0];

  Container midView = Container (
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$city, "
              "$country",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black87
          ),),
          Text(Util.getFormattedDate(formattedDate),
              style: const TextStyle(
              fontSize: 16.0
          ),),
          const SizedBox(height: 11.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].main, color: Colors.green, size: 198.0),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${forecast.main!.temp.toStringAsFixed(0)} °F",
                      style: const TextStyle(
                          fontSize: 30.0
                      ),
                    ),
                    Text(forecast.weather[0].description.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12.0
                        )),])
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.wind.speed.toStringAsFixed(1)}mi/h"),
                      const Icon(FontAwesomeIcons.wind, size: 20.0),
                    ],),),

                Row(
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text("${forecastList[0].main!.humidity.toStringAsFixed(0)}%"),
                          Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20.0, color: Colors.orangeAccent.shade400)
                      ]
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast.main!.tempMax.toStringAsFixed(0)}°F"),
                        Icon(FontAwesomeIcons.wind, size: 20.0, color: Colors.blueAccent.shade100)
                      ]
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )
  );
  return midView;
}