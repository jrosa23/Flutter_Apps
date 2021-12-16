import 'package:first_flutter_app/parsing_json/json_parsing_map.dart';
import 'package:first_flutter_app/weather_forecast/weather_forecast.dart';
import 'package:flutter/material.dart';

//runApp(const MaterialApp(home: (MovieListView())));
//runApp(const ScaffoldExample());
//runApp(const MaterialApp(home: BillSplitter()));
// final ThemeData _appTheme = _buildAppTheme();
/*ThemeData _buildAppTheme(){
    final ThemeData base = ThemeData.dark();
     return base.copyWith(
       brightness: Brightness.dark,
       primaryColor: Colors.green,
       colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.brown),
       scaffoldBackgroundColor: Colors.brown.shade100,
       backgroundColor: Colors.brown.shade900,
       textTheme: _appTextTheme(base.textTheme)
     );
 }

  */
/*TextTheme _appTextTheme(TextTheme base){
   return base.copyWith(
       headline1: base.headline1!.copyWith(
         fontWeight: FontWeight.w500,
         fontSize: 18.0,
           fontFamily: 'DancingScript'
       ),
     caption: base.caption!.copyWith(
       fontWeight: FontWeight.w400,
      fontSize: 14.0
     ),
     button: base.button!.copyWith(
       letterSpacing: 3.0,
       fontSize: 23.9,
       fontFamily: 'DancingScript'
     ),
     bodyText1: base.bodyText1!.copyWith(
       fontSize: 16.9,
       color: Colors.black
     ),
     bodyText2: base.bodyText2!.copyWith(
       fontSize: 25.0,
       color: Colors.green.shade800
     )
   ).apply(
       fontFamily: 'DancingScript',
     displayColor: Colors.brown.shade800,
     bodyColor: Colors.brown.shade500,
   );
 }

  */

void main() => runApp( const MaterialApp(home: WeatherForecast()));
