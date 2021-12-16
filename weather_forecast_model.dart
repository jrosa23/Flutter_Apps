class WeatherForecastModel {
  late String cod;
  late int message;
  late int cnt;
  late List<Lista> list;
  late City city;

  WeatherForecastModel(
      {required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
        required this.city});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Lista>[];
      json['list'].forEach((v) {
        list.add(Lista.fromJson(v));
      });
    }
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    data['list'] = list.map((v) => v.toJson()).toList();
    data['city'] = city.toJson();
    return data;
  }
}

class Lista {
  late int dt;
  late Main? main;
  late List<Weather> weather;
  late Clouds clouds;
  late Wind wind;
  late int visibility;
  late dynamic pop;
  late Sys sys;
  late String dtTxt;
  late Rain? rain;

  Lista(
      {required this.dt,
        required this.main,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        required this.sys,
        required this.dtTxt,
        required this.rain});

  Lista.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    clouds =
    (json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null)!;
    wind = (json['wind'] != null ? Wind.fromJson(json['wind']) : null)!;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = (json['sys']!= null ? Sys.fromJson(json['sys']) : null)!;
    dtTxt = json['dt_txt'];
    rain = (json['rain']!= null ? Rain.fromJson(json['rain']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['main'] = main!.toJson();
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['clouds'] = clouds.toJson();
    data['wind'] = wind.toJson();
    data['visibility'] = visibility;
    data['pop'] = pop;
    data['sys'] = sys.toJson();
    data['dt_txt'] = dtTxt;
    data['rain'] = rain!.toJson();
    return data;
  }
}

class Main {
  late dynamic temp;
  late dynamic feelsLike;
  late dynamic tempMin;
  late dynamic tempMax;
  late dynamic pressure;
  late dynamic seaLevel;
  late dynamic grndLevel;
  late dynamic humidity;
  late dynamic tempKf;

  Main(
      {required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.seaLevel,
        required this.grndLevel,
        required this.humidity,
        required this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'].toDouble();
    feelsLike = json['feels_like'].toDouble();
    tempMin = json['temp_min'].toDouble();
    tempMax = json['temp_max'].toDouble();
    pressure = json['pressure'].toDouble();
    seaLevel = json['sea_level'].toDouble();
    grndLevel = json['grnd_level'].toDouble();
    humidity = json['humidity'].toDouble();
    tempKf = json['temp_kf'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}

class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;

  Weather(
      {
        required this.id,
        required this.main,
        required this.description,
        required this.icon
      }
      );

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Clouds {
  late int all;
  Clouds({required this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Wind {
  late dynamic speed;
  late dynamic deg;
  late dynamic gust;
  Wind(
      {
        required this.speed,
        required this.deg,
        required this.gust
      }
      );

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class Sys {
  late String pod;
  Sys({required this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}

class Rain {
  late double d3h;
  Rain({required this.d3h});
  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }
}

class City {
  late int id;
  late String name;
  late Coord coord;
  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  City(
      {required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null)!;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord.toJson();
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Coord {
  late double lat;
  late double lon;

  Coord({required this.lat, required this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

