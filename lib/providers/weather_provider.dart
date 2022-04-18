import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/models/weather.dart';

import '../models/city.dart';

class WeatherProvider{
  Future<Weather?> getWeatherForCity(City city) async {
    String apiUrl = "https://www.metaweather.com/api/location/"+city.woeid.toString();

    try {
      Response response = await Dio().get(apiUrl);
      if (response.statusCode==200){
        var json = response.data['consolidated_weather'][0];
        return Weather.fromJson(json);
      }

      return null;
    } catch (e) {
      print(e);
    }

    return null;
  }
}