class WeatherModel {
  final String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? image;
  final DateTime date;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      this.image,
      required this.date,
      required this.condition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        temp: json['current']['temp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        date: DateTime.parse(json['current']['last_updated']),
        condition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
