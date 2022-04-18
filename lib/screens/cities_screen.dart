import 'package:flutter/material.dart';
import 'package:weather/app_style.dart';
import 'package:weather/repositories/cities_repository.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/widgets/list_button_widget.dart';

import '../models/city.dart';

class CitiesScreen extends StatelessWidget {
  List<City> items = CitiesRepository().getAll();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppStyle.screenBgColor,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return ListButtonWidget(items[index]);
        },
      ),
    );
  }

}


