import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(this.weatherService) : super((WeatherInitialState()));
  WeatherModel? weatherModel;
  WeatherService weatherService;
  void getWeatherData({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getWeatherData(cityName: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
