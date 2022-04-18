import '../models/city.dart';

class CitiesRepository{

  List<Map<String,dynamic>> cities = [
    {
      "title":"Москва",
      "woeid":"2122265",
    },
    {
      "title":"Сидней",
      "woeid":"1105779",
    },
    {
      "title":"Лондон",
      "woeid":"44418",
    },
    {
      "title":"Мадрид",
      "woeid":"766273",
    },
    {
      "title":"Берлин",
      "woeid":"638242",
    },
  ];

  List<City> getAll(){
    return cities.map((item)=> City.fromJson(item)).toList();
  }

}