import 'package:dio/dio.dart';
import 'package:weather/providers/api_client.dart';

import '../models/city.dart';
import '../models/weather.dart';
import '../providers/weather_provider.dart';

class WeatherRepository{
  Future<Weather?> getWeatherForCity(City city) async{
    // return WeatherProvider().getWeatherForCity(city);
    final dio = Dio();
    final apiClient = ApiClient(dio);
    var data = await apiClient.getWeatherForCity(city.woeid);
    return data;
  }
}