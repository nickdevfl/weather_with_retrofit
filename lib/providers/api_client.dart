import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/models/weather.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://www.metaweather.com/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/location/{woeid}/")
  Future<Weather> getWeatherForCity(@Path("woeid") int woeid);
}


