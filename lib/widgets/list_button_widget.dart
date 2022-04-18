import 'package:flutter/material.dart';

import '../app_style.dart';
import '../models/city.dart';
import '../screens/weather_screen.dart';

class ListButtonWidget extends StatelessWidget {
  City city;

  ListButtonWidget(this.city);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        width:double.infinity,
        height: AppStyle.listBtnHeight,
        margin: EdgeInsets.all(AppStyle.listBtnMargin),
        decoration: BoxDecoration(
            color: AppStyle.listBtnBgColor,
            borderRadius: BorderRadius.all(Radius.circular(AppStyle.listBtnBorderRadius))
        ),
        child: Text(
            city.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppStyle.listBtnFontSize,
              color: AppStyle.listBtnFontColor,
            )),
      ),
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> WeatherScreen((city)) )
        );
      },
    );
  }
}
