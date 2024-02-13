import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     title: Text("Search City"),
   ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
              var getWeatherCubit= BlocProvider.of<WeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);


            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16
              ),
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              hintText: "Enter the city",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
