import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/util/convert_icon.dart';
import 'package:first_flutter_app/weather_forecast/util/forecast_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastCard (AsyncSnapshot<WeatherForecastModel> snapshot, int index){
    var forecastList = snapshot.data!.list;
    var dayOfWeek = "";
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(forecastList[index].dt * 1000000);
    var fullDate = Util.getFormattedDate(date);
    dayOfWeek = fullDate.split(",")[0];

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(dayOfWeek),
                )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 33.0,
                backgroundColor: Colors.white,
                child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main, color: Colors.blueAccent, size:38.0)
                ),
              Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${forecastList[index].main!.temp.toStringAsFixed(0)}°F"),
                        ),
                        const Icon(FontAwesomeIcons.solidThumbsUp, color: Colors.white, size: 17.0),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${forecastList[index].main!.feelsLike.toStringAsFixed(0)}°F"),
                        ),
                        const Icon(FontAwesomeIcons.solidThumbsDown, color: Colors.white, size: 17.0),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Hum: ${forecastList[index].main!.humidity.toStringAsFixed(0)}%"),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Wind: ${forecastList[index].wind.speed.toStringAsFixed(0)}mi/h"),
                        ),
                      ],
                    ),

                  ]
              )
            ],
          ),
        ],
    );
}