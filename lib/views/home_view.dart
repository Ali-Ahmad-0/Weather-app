import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weather_model.dart' show WeatherModel;
import 'package:weather/views/failure_screen.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/no_weather_info_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchView();
              }));
            },
            iconSize: 35,
            color: Colors.black,
          ),
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherSuccessState) {
          return WeatherInfoBody(
            weatherModel: state.weatherModel,
          );
        } else if (state is WeatherFailureState) {
          return FailureScreen(
            message: state.errorMessaege,
          );
        } else if (state is WeatherLoadingState) {
          return Skeletonizer(
            child: WeatherInfoBody(
                weatherModel: WeatherModel(
                    cityName: 'cityName',
                    temp: 0.0,
                    maxTemp: 0.0,
                    minTemp: 0.0,
                    date: DateTime.now(),
                    condition: 'condition')),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
