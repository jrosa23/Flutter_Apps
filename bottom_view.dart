import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forecast_card.dart';

Widget bottom_view(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){
  var forecast = snapshot.data!.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("7-Day Weather Forecast".toUpperCase(),
      style:  const TextStyle(
        fontSize: 14.0,
        color: Colors.black87
        ),
      ),
      Container(
        height: 170.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemCount: forecast.length,
            itemBuilder: (context, index) =>  ClipRRect(
              borderRadius:  const BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: MediaQuery.of(context).size.width/2.3,
                height: 160.0,
                child: forecastCard(snapshot, index),
                decoration:  const BoxDecoration(
                  gradient: LinearGradient(colors:
                  [Color(0xff7879ff), Colors.white],
                    begin: Alignment.topLeft, end: Alignment.bottomRight
                  )
                )
              )
            ),
        )
      ),
    ]
  );
}