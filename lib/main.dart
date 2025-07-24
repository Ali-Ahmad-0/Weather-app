import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/service/weather_service.dart';
import 'package:weather/views/home_view.dart';
import 'package:weather/widgets/colors.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(WeatherService(dio: Dio())),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition ??
                      '',
                ),
                useMaterial3: false,
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}
