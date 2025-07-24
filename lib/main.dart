import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
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

MaterialColor getWeatherColor(String condition) {
  if (condition == '') {
    return Colors.red;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'moderate or heavy sleet':
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.teal;
    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
    case 'light rain shower':
      return Colors.blue;
    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'light snow showers':
    case 'patchy sleet possible':
    case 'light sleet':
    case 'light sleet showers':
    case 'patchy freezing drizzle possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'blowing snow':
    case 'blizzard':
    case 'heavy snow':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;

    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'freezing fog':
      return Colors.deepPurple;

    case 'fog':
      return Colors.blueGrey;

    case 'moderate rain':
    case 'moderate rain at times':
    case 'moderate or heavy rain shower':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.indigo;

    case 'moderate snow':
    case 'patchy heavy snow':
    case 'moderate or heavy snow with thunder':
      return Colors.cyan;
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.blue;
    default:
      return Colors.grey; // Default color for unknown conditions
  }
}
