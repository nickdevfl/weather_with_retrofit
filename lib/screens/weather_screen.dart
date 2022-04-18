import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app_style.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/bloc/weather_state.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/widgets/weather_widget.dart';

import '../bloc/weather_event.dart';
import '../models/city.dart';


class WeatherScreen extends StatelessWidget {
  final City city;

  WeatherScreen(this.city);

  late WeatherBloc weatherBloc;

  @override
  Widget build(BuildContext context) {
    weatherBloc = context.read<WeatherBloc>();
    weatherBloc.add(WeatherLoadEvent(city));

    return Material(
        color: AppStyle.screenBgColor,
        child: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoadingState) {
                        return const CircularProgressIndicator();
                      }

                      if (state is WeatherErrorState) {
                        return const Icon(Icons.error_outline);
                      }

                      if (state is WeatherLoadedState) {
                        return WeatherWidget(city: city, weather: state.weather);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      weatherBloc.add(WeatherLoadEvent(city));
                    },
                  ),
                ),
              ]
            )
        )
    );

  }
}