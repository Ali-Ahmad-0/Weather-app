import 'package:weather/model/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
 final String errorMessaege;
 WeatherFailureState(this.errorMessaege);
}
class WeatherLoadingState extends WeatherState {

}
