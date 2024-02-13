class WeatherModel{

  String cityName;
 DateTime date;
  String? image;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherCondition;

  WeatherModel(
      { required this.cityName,
        required this.date,
         this.image,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherCondition});

   factory WeatherModel.fromJson(json){
      return WeatherModel(
        cityName:json['location']['name'],
        date:DateTime.parse(json['current']['last_updated']),
        image:json['forecast']['forecastday'][0]['day']['condition']['icon'] ,
        temp:json['forecast']['forecastday'][0]['day']['avgtemp_c'] ,
        maxTemp:json['forecast']['forecastday'][0]['day']['maxtemp_c']  ,
        minTemp:json['forecast']['forecastday'][0]['day']['mintemp_c'] ,
        weatherCondition:json['forecast']['forecastday'][0]['day']['condition']['text'] ,

      );

            }
}