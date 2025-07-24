import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super((WeatherInitialState()));
   WeatherModel? weatherModel;
  getWeatherData({required String cityName}) async {
    try {
         weatherModel =
          (await WeatherService(dio: Dio()).getWeatherData(cityName: cityName))!;
      emit(WeatherLoadedState(weatherModel!));
    } on Exception {
      emit(WeatherFailureState());
    }
  }
}
