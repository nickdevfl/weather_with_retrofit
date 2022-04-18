import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather{
  double temperature;
  String abbreviation;

  Weather({
    required this.temperature,
    required this.abbreviation,
  });

  factory Weather.fromJson(Map json){
    return Weather(
      temperature : json['consolidated_weather'][0]['the_temp'] as double,
      abbreviation : json['consolidated_weather'][0]['weather_state_abbr'].toString(),
    );
  }

}

