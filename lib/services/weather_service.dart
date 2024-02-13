

   import 'package:dio/dio.dart';
   import 'package:weather_app/model/weather_model.dart';

   class WeatherService{
   Dio dio;
   WeatherService(this.dio);
   Future<WeatherModel> getCurrentWeather({required String cityName})async{
  try {
    Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=7b028f4e1cd249d2a46190848240501&q=$cityName&days=10&aqi=no&alerts=no');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }on DioException catch(e) {
    String errorMessage = e.response?.data['error']['message'] ?? "Error";
    throw Exception(errorMessage);
  } catch(e){
    print(e.toString());
    throw Exception("Oops error");
  }
   }
}

