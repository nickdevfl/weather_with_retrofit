import '../models/city.dart';

abstract class WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {
  final City city;
  WeatherLoadEvent(this.city);
}

