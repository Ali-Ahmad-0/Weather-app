import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Form(
            key: formState,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a city name';
                }
                return null;
              },
              onFieldSubmitted: (value) async {
                if (formState.currentState!.validate()) {
                  BlocProvider.of<GetWeatherCubit>(context)
                      .getWeatherData(cityName: value);
                  Navigator.pop(context);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: 'Enter city name',
                  labelText: 'Search',
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
