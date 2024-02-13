import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/weather_cubit.dart';
import '../model/weather_model.dart';

class InfoWeatherBody extends StatelessWidget{
  const  InfoWeatherBody({Key? key,required this.weather}):super(key: key);
 final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
  WeatherModel weatherModel= BlocProvider.of<WeatherCubit>(context).weatherModel!;
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
      
                  color: Color(0xFFBDBDBD),
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],

                ),
                child: Center(
                  child: Text(weatherModel.cityName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 30
                  ),),
                ),
              ),
              SizedBox(height: 20,),
              Text(
              "updated at : ${weatherModel.date.hour}:${weatherModel.date.minute} "
                // "updated at :${weatherModel.date.hour}:${weatherModel.date.minute}"
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                      "https:${weatherModel.image}",
                    scale: 0.5,
                     ),
                  SizedBox(width: 15,),
                  Text(
                      "${weatherModel.temp.round()} "+'°',
                    style: TextStyle(
                      fontSize: 60
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Text(" Max Temp : ${weatherModel.maxTemp.round()}"+'°'),
                      Text("Min Temp : ${weatherModel.minTemp.round()}"+'°')
                    ],
                  )
      
                ],
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.black,
                      width: 1.5, // Underline thickness
                    ))
                ),
                child: Text(weatherModel.weatherCondition,
                style: TextStyle(
                  fontSize: 30,
      
      
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
//fun for return only time
// DateTime stringToDateTime(String value){
//   return DateTime.parse(value);
//
// }

