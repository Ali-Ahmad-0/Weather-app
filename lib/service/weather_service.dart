import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/model/weather_model.dart';

class WeatherService {
  String baseURL = 'http://api.weatherapi.com/v1';
  String apiKey = '406d3fbb0ecc472ab05203102242809';
  WeatherService({required Dio dio});
  Dio dio = Dio();
  Future<WeatherModel?> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessege = e.response?.data['error']['messege'] ??
          'There is something went wrong , please try again later !';

      throw Exception(errorMessege);
    }
    catch (e) {
      log(e.toString());
      throw Exception(
          'There is something went wrong , pleace try again later !');
    }
  }
}
