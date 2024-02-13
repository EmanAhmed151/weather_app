
import '../../model/weather_model.dart';

class WeatherState{}
class InitaialWeatherState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weathermodel;

  WeatherLoadedState(this.weathermodel);

}
class WeatherFailureState extends WeatherState{
  final String errMessage;

  WeatherFailureState(this.errMessage);
}
