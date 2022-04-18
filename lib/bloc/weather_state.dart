import '../models/weather.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  Weather weather;
  WeatherLoadedState(this.weather);
}

class WeatherErrorState extends WeatherState {}