import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/app_style.dart';

import '../models/city.dart';
import '../models/weather.dart';

class WeatherWidget extends StatefulWidget {
  City city;
  Weather weather;

  WeatherWidget({
    required this.city,
    required this.weather
  });

  @override
  WeatherWidgetState createState()=>WeatherWidgetState();
}

class WeatherWidgetState extends State<WeatherWidget>{

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://www.metaweather.com/static/img/weather/${widget.weather.abbreviation}.svg";


    return OrientationBuilder(builder: (context, Orientation orientation){
      if (orientation==Orientation.landscape){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(imageUrl,height: 150),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.city.title,style: TextStyle(fontSize: 40)),
                Text(widget.weather.temperature.round().toString()+"℃",style: TextStyle(fontSize: 30))
              ],
            )
          ],
        );
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.network(imageUrl,height: 150),
          SizedBox(height: 20),
          Text(widget.city.title,style: TextStyle(fontSize: 40)),
          SizedBox(height: 10),
          Text(widget.weather.temperature.round().toString()+"℃",style: TextStyle(fontSize: 60))
        ],
      );



    });
  }

}
