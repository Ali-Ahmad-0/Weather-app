import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
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
                return const SearchView();
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
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(
            weatherModel: state.weatherModel,
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.blueGrey.shade700],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Center(
                child: Text(
                  'Oops , there is something went wrong ! , try again ⛔',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width ,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade300),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
