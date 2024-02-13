import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/model/weather_model.dart';

import '../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit():super(InitaialWeatherState());
   WeatherModel? weatherModel;
  getWeather({required String cityName})async{
    try{
       weatherModel =await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
        emit(WeatherLoadedState(weatherModel!)) ;
    }catch(e){
      emit(WeatherFailureState(
        e.toString()
      ));
    }
  }

}